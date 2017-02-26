package bean;

/**
 * Created by Allen on 2017/2/25.
 */
public class CompInfo {
    private String iCompId;
    private String sCompNum;
    private String sCompName;
    private String sCompNote;
    private int sCompActive;

    public String getiCompId() {
        return iCompId;
    }

    @Override
    public String toString() {
        return "CompInfo{" +
                "iCompId=" + iCompId +
                ", sCompNum='" + sCompNum + '\'' +
                ", sCompName='" + sCompName + '\'' +
                ", sCompNote='" + sCompNote + '\'' +
                ", sCompActive=" + sCompActive +
                '}';
    }

    public CompInfo(String iCompId) {

    }

    public CompInfo(String iCompId, String sCompNum, String sCompName, String sCompNote, int sCompActive) {
        this.iCompId = iCompId;
        this.sCompNum = sCompNum;
        this.sCompName = sCompName;
        this.sCompNote = sCompNote;
        this.sCompActive = sCompActive;
    }

    public void setiCompId(String iCompId) {
        this.iCompId = iCompId;

    }

    public String getsCompNum() {
        return sCompNum;
    }

    public void setsCompNum(String sCompNum) {
        this.sCompNum = sCompNum;
    }

    public String getsCompName() {
        return sCompName;
    }

    public void setsCompName(String sCompName) {
        this.sCompName = sCompName;
    }

    public String getsCompNote() {
        return sCompNote;
    }

    public void setsCompNote(String sCompNote) {
        this.sCompNote = sCompNote;
    }

    public int getsCompActive() {
        return sCompActive;
    }

    public void setsCompActive(int sCompActive) {
        this.sCompActive = sCompActive;
    }


}
