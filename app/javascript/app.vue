<template>  
  <table class="table table-bordered table-striped table-hover" id="myTable">
  <thead class="thead-dark">
    <tr>
      <th width=20%>商品名稱</th>
      <th id="centre">價錢</th>
      <th id="centre">備註</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
      <tr v-for="p in products" :key="p.id">
        <td class="align-middle">{{ p.name }} <br> {{ p.supplier.name }}</td>
        <td class="align-middle" id="centre">
          <quick-edit v-model="p.price" @input="edit_new_price(p)" buttonOkText="確認" buttonCancelText="取消"></quick-edit>
        </td>
         <td class="align-middle">
           <quick-edit v-model="p.comment" @input="edit_new_price(p)" buttonOkText="確認" buttonCancelText="取消"></quick-edit>
        </td>
        <td class="col d-flex justify-content-center" >
          <div class="card justify-content-center" style="max-width: 18rem;" >
            <img v-bind:src="p.url" class="card-img">
          </div>
        </td>
      </tr>
  </tbody>
</table>
</template>

<script>
import axios from 'axios'
import QuickEdit from 'vue-quick-edit';

  export default {
    components: { QuickEdit },
    vueQuickEditClasses: {
      wrapper: 'form-group form-inline',
      input: 'form-control input-sm',
      buttons: 'btn-group btn-group-sm',
      buttonOk: 'btn btn-primary',
      buttonCancel: 'btn btn-link',
    },
    data: function () {
      return {
        products: null,
        tagEditingID: ''
      }
    },
    beforeCreate () {
      axios.get('/api/v1/products.json')
        .then(response => (this.products = response.data))
    },
    methods: {
      setToEditing(e, p) {
        this.tagEditingID = p.id
      },
      formatPrice(value) {
        let val = (value/1).toFixed(0)
        return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
      },
      edit_new_price(product) {
        var productId = product.id
        var local = { price: product.price, comment: product.comment }
        axios.put(`/api/v1/products/${product.id}.json`, local)
         .then(function (response) {
           return response.data;
         }).catch(function (error){
           console.log(error);
         })
      }
    }
  }
</script>

<style scoped>
#centre {
  text-align: center;
}

.form-group {
  margin-bottom: 0;
  display: inline-block;

}
.btn-group {
  display: inline-block;
}

</style>