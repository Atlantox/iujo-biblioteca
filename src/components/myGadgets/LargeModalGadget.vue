<script setup>
const props = defineProps({
    componentToShow: Object,
    modalName: String,
    title: String
})
</script>

<template>
    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" :id="props.modalName" :aria-labelledby="props.modalName" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header border-none">
                    <button type="button" class="close border-none bg-none fs-1" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h3 class="text-center">
                        {{ props.title }}
                    </h3>
                    <component :is="props.componentToShow" />
                </div>
            </div>
        </div>
    </div>

</template>

<style scoped>
.icon-container{
    width:60px;
    height:60px;
}
</style>