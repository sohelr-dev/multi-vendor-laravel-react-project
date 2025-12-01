declare module '@ckeditor/ckeditor5-react' {
    import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';
    export { ClassicEditor };
    export class CKEditor extends React.Component<any, any> {}
}
