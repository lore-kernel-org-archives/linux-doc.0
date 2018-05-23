Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C12097D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 14:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933175AbeEWO3u (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 10:29:50 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:58970 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933269AbeEWO3t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 10:29:49 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
        by m0089730.ppops.net (8.16.0.22/8.16.0.22) with SMTP id w4NESn3H000346;
        Wed, 23 May 2018 07:29:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=facebook;
 bh=V6NiS+iv1E3DnWgUEB159Le0tlUvqyGEf/oHuzw3m2I=;
 b=C268ly3ZqatlSnKxrDofU0PYDPH1vTu3BC4gzVlZfTiz49A71Jq3LWJJtzDKJSkI2Nz7
 cFCy7ygbRzrSipP4oWhzqlmbs5fvBGtsXoOeC/B+jq6uUUVvrZmBm8hW0b0z/WFOUJ+m
 beabf4KxGZPFQud1kJayj5mvOEG8baLU0+I= 
Received: from mail.thefacebook.com ([199.201.64.23])
        by m0089730.ppops.net with ESMTP id 2j56ub8hcs-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 23 May 2018 07:29:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.14) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Wed, 23 May 2018 07:29:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6NiS+iv1E3DnWgUEB159Le0tlUvqyGEf/oHuzw3m2I=;
 b=SIIKPcLNVpwxO4fmyHDgFePF2cTqNXjDGT66Zr2Aw70vGy0du+y5yXd2iIkDTrapCU7Sm/PILVfam7LfOBl81WzKq7pCvTm5dphQ2mUaY8Btuxe/LdR4Bu3TOvYta3D/XMHV1nqkKGsvtMASjaLUAz4+9EeKTz916WQzoXSNdbY=
Received: from [IPv6:2620:10d:c0a3:10fb::15b] (2620:10d:c091:200::2:5b8b) by
 MW2PR1501MB1963.namprd15.prod.outlook.com (2603:10b6:302:b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11; Wed, 23
 May 2018 14:28:43 +0000
Subject: Re: [PATCH 1/5] PCI/AER: Define and allocate aer_stats structure for
 AER capable devices
To:     "Alex G." <mr.nuke.me@gmail.com>, Rajat Jain <rajatja@google.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Kyle McMartin <jkkm@fb.com>
CC:     <rajatxjain@gmail.com>
References: <20180522222805.80314-1-rajatja@google.com>
 <20180522222805.80314-2-rajatja@google.com>
 <62fae8eb-aaed-65b2-19ad-7c57b3a9bfdc@fb.com>
 <53789ac0-b571-5d6a-5925-7e83925b5b31@gmail.com>
From:   Jes Sorensen <jsorensen@fb.com>
Message-ID: <b25d5e6a-9373-2295-33e6-699fa74a94eb@fb.com>
Date:   Wed, 23 May 2018 10:28:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <53789ac0-b571-5d6a-5925-7e83925b5b31@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2620:10d:c091:200::2:5b8b]
X-ClientProxiedBy: BN6PR08CA0049.namprd08.prod.outlook.com
 (2603:10b6:404:b9::11) To MW2PR1501MB1963.namprd15.prod.outlook.com
 (2603:10b6:302:b::23)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);SRVR:MW2PR1501MB1963;
X-Microsoft-Exchange-Diagnostics: 1;MW2PR1501MB1963;3:H9JtGedjF63anSDOZS/fJOCZOhpgLbYqJT+KSeWKQutbdeT8ugXDJdAUbKaXkjXRBqIc5/e71yQvVe1uBAoqeFIj2t/mU++Q6q898gcDKmPNfrXC2n1uQ9dkcmZnUKptRz3aWPv6rGlgr1+omCWM15ka9ae8Au8OD6pBOUERP6I93cjOLhMCFrTL0j/FLYsXRU0ai21bvSAzWE3PdQkFI46Gh0vfYJcv5JQYML1z1MoOCb11Bqb+QHF2D+wXu3zL;25:IvyhOx6ZqlJhzL2+pJV5HvMRkUxQMvQeFkCWQKAJ3KPK3+Ka3cMah1+IP/TfqlVkvu17kgNsiphkioDIkpWC9V13pApghaYOPCP2t/3SAe0qWq7O3lnBbgq/ErnkZ3nj6NYvYqgh7FDjHIPtw3V0Fi/lnihnth5vjamB5Y8t8e8eveog843QPbjakb+70+cFd0+j+6jhwWScVMdFvijFI8OH08/PfUwXwpXosyS6TaADTIByvZt52PJO9fj+nnZVxt8Jdth5Pf1u3AigH1tb1IjbfBaroqhkCrc9rdV1RrKfooQMeTNvFmNPiV/2HzaC/+ybYDT9ABO8y60jW1H5YQ==;31:LlrFDtAO0ymsi/wqAvuas9d+cngceDGyaHtPAiNbMwHVdLKI43gKGv12B+UT73EZxnIS3NPTsMCHzRFtY1C1w52fDud9d1uyCJPuEwvbpEf/AsfQg1wi42m8yuI4zYV/CRbzn76OfkF/0RPRjdxb5RFoqp64SnSe7M98mDFR15GJr75JLZAfpWwGft26BMuhWDV3Bn04v4ks4NB6SPFmjXFR9z1FJZhYbA4B6LYp49c=
X-MS-TrafficTypeDiagnostic: MW2PR1501MB1963:
X-Microsoft-Exchange-Diagnostics: 1;MW2PR1501MB1963;20:MdXcYd33F2dfbPt4MgR6rh+44v9kMHKDLYq6Y4n3ZDgLzSom8inl3Jfy7TcJOx092zaxGhP81suEeT1RK2iZiU8cDPxzyvPWOqqxNBSuxp8OqG5E+TTHoUn03hA4LxQS1X5gTIhSEwyDBntIdhV2rFfN7L30Btb3I6PDFOIjV5Y24846mh/kIeFVJcMzcZB/tkmzbTypF3BWSfAIYhX3x4/KKbcj9YO3biIlT1wueEuDCpCuxet4P9rscpYQlLGhFsSKw6Ldl8Oao0Z697oRjCqOPGBq57NOvEiFE0d9VWZrd/YGNAmOJ3Hd42Qw8YFaF2v8wvZQQsrefVTK05D7dnFtgpAf2Nmvyg3fb5SsJ4DXy3ZXzUm4Q1EO9tOlylvj4J3nRD/fSyjKA/jBTuhKW13f30qZusEy12FEBKJnw5uDHLFRKh3IAeUPsJqW1tfvUdaBlskDbCGdik22nnqCERzbyF4gQpSzHaBUVluPt0wiIjHXN6ABpSKy7COiiWR4;4:o7AmIUdcGFTC121t9sCXOrj0jOQncQV4byBOuWY0NKv530SrGk60HtEjKjU+1gjFcdsuAKMbvKRqanc0N6IyU3yDAb9hcv1IzEzU/UFOaetWs9La7qHTJG0Vd/Ia+9HTui92G5VR0vOSeSP5By/a//dCbQOUx7qz7YuHNih6mrz/l20LvVSeIxazblFTODuHlHNBGJYBulsq9pfGSuEaZQE2FkpcyZ3kIJdEBXcLaF1wsNYHT1DcL7E2AqcmvDDU+lAZibcg2rr8VUp6YZQGxg==
X-Microsoft-Antispam-PRVS: <MW2PR1501MB1963EAB57F4F3D0F5762AC14C66B0@MW2PR1501MB1963.namprd15.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(11241501184)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123560045)(6072148)(201708071742011)(7699016);SRVR:MW2PR1501MB1963;BCL:0;PCL:0;RULEID:;SRVR:MW2PR1501MB1963;
X-Forefront-PRVS: 06818431B9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(346002)(39380400002)(39860400002)(376002)(366004)(396003)(199004)(189003)(76176011)(2906002)(6486002)(64126003)(6116002)(36756003)(386003)(6246003)(106356001)(229853002)(52116002)(53546011)(2486003)(105586002)(52146003)(23676004)(52396003)(46003)(39060400002)(31696002)(25786009)(305945005)(65826007)(31686004)(86362001)(50466002)(81166006)(11346002)(6666003)(478600001)(446003)(93886005)(65806001)(65956001)(97736004)(81156014)(6636002)(7736002)(476003)(53936002)(4326008)(68736007)(2616005)(110136005)(316002)(486006)(16526019)(186003)(8676002)(1706002)(8936002)(5660300001)(47776003)(7416002)(58126008)(230700001)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:MW2PR1501MB1963;H:[IPv6:2620:10d:c0a3:10fb::15b];FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNVzJQUjE1MDFNQjE5NjM7MjM6SFZQci9EWW5TVlpUTXRGVVdNcGdEUVNN?=
 =?utf-8?B?OSs4QUZtOVhGMkdQU2RQeWpsVVZGd3lvaWdQVnI5REw0WlhSTFVTUHRIaUtu?=
 =?utf-8?B?bXU2YlR2QnJrMzQvOEdsVGZxc2wvVlJNRFAyRi9ZZGlQazJKVEs1YnFNOVBs?=
 =?utf-8?B?Tnp3eUhuNm1SNVVLNm9DaFVsNDQxc1JCaHZRQUlOeUI5Y3NuNU9YVmpHL0hL?=
 =?utf-8?B?N3dDRGsrSExjTEIyU3hod1B5R3dhYmc1Ym4vT2MzM1JnM0hmcitHVlZRZjFn?=
 =?utf-8?B?eEhPc1hIVUlYbkVwb05oRkVmcmdnQmxyYmhZSVhwMVJaeXlJdGk0VmYrUklM?=
 =?utf-8?B?Mmp3TVpyN1lWZU9kcUVHZDg1YjEvR2lRSDdCWFVsMlNEV0VRcmJKVVpPb1R5?=
 =?utf-8?B?UHlqS1FBZEdWeVA3L0IyQ3c0SVpTd20yYjVoTWE2YUZCTUVROWo3Rlp2OVpO?=
 =?utf-8?B?Vy81MXFtZ1JGTVBDYkRrUmhkZEVwT0NCOE1pemRWQmtBREVrTXkrUG9pWlVM?=
 =?utf-8?B?dG5VdXluMk1VUHhiZTl3bTR0YUYyM1VSRkhDcGVNWkJPV1NRVlRoQjZhL1FL?=
 =?utf-8?B?MnJEYWpQblhicEppTkZmbWRnN1FhRGlZNTRqRmNKQU1uR0RiZkRTQlV2MG53?=
 =?utf-8?B?UDFJSElXNzBkMEZiakpsRlk2TVA0bXlDUmoreWhZMlZJZnRTWGhRTmVYQktX?=
 =?utf-8?B?QnBYUW4ydlNRdGZ2R1lQRmlNVGFvcFNBSVdzWFRLUnlpakE1RlNHUnptSGNs?=
 =?utf-8?B?Ly9vSUp0UCtvRUovSjNFSUpKc0puT1FUcUhuV3orOEJzMk80djFXMHVnSVJm?=
 =?utf-8?B?M0o4eEJBT0ZMRC9pc1VuYnZEdCs4c3h5VmgzZk0zcENCbExTdEduTU5aQmxU?=
 =?utf-8?B?d3YyejU5Q1RZanNqaW1EZ1d3RnNtNngyMjJRWHZoeElKR1J0UkhoRzBlbGN6?=
 =?utf-8?B?di8xNnhQdm5DcFN0ODAvekhoYzRBOUtza2Y3QktabXNEZWJ6bzRSaTJXZ0RR?=
 =?utf-8?B?Mm5QdVozeWxSbFI2RjRlN3dtMDNkU3RJeDU2M21nY25kaFF3aG9CWjQ2TDVx?=
 =?utf-8?B?eXZzbWFERGljVTVqcjhWYnQrQWdzbitOaGR5c01Mc1pjUE8zRjAxMWNYYTM5?=
 =?utf-8?B?RU1rOVRSd2hka2ZtVmpzU0xBMnhCRXJLNW0xUkV1bGFKeDE3bE82cEE1MFl5?=
 =?utf-8?B?R2tQQnFKV2FYeHF4ZTZjVUFPN0YzbWhyckJWNnVBOFM0Z25GZ0gzVmYzQUtw?=
 =?utf-8?B?aVJKQ0g2a3MzWHhaeEFzN1dqVXhZem53RjEvNEhiQ09sRDA1Uk9GQUZTVlVO?=
 =?utf-8?B?dVBmdHI0d0NOMSt2d1lqUUl5UDBmd1FhNy85bTBpVlN2RVhINlJYNytBZCtw?=
 =?utf-8?B?M21LV2tWZWdsQTNSOE56bktjS0dBOGdTSTlsWExMZ3lrY2VucDRpWXh3TVVm?=
 =?utf-8?B?ekYvOXIyN2FXcENoRnlhV283Y250Q3EwUENqOWJsbEo0ODE1SEFzVE9MK3JP?=
 =?utf-8?B?aTlXRWJKWFRZQWEvRk1vYzQ3dUh4QkpVL1lWSmNyUW5NZlRJOE1qMVdlMm5J?=
 =?utf-8?B?NVFXTmpLWmlxZEpHcnZRTmlCd1p2bXhpQVZQMjNVSkFlcm9iUEh1TVFCcllU?=
 =?utf-8?B?TkxPeWNteXFQR3lFMmFvcUlmY3p5dXZhdFRRbWF4aVJIUS93NkdMVVRPTFRn?=
 =?utf-8?B?OG9TVGRWSlJET2J3dWo0T01qZ05PZEVEUDduQzZMbm9KRjNMVENOWktrVEsv?=
 =?utf-8?B?K2MxRE9zc2JkVUNuU3VpMmdveFdHazR0WHAwZVpFRlVOWDN2Uk5uK05XS20x?=
 =?utf-8?B?dUNINk00dHR6cGR5ZzN4Uk1BcnhUdS9EVk83N1ZzY0NPUW96UWtGbTBLc0JP?=
 =?utf-8?B?OTdoL3RydVIwSTVJbEVOcjVqNzRodW40bVNzTFJPYnJ4UGIzNDlJZkwyMFhC?=
 =?utf-8?B?SDRwdmU3ajA2ODFhTnNMMmxvTFg0RjIxdGowcWZEYTdMTyswTDJGZ0EwUXZD?=
 =?utf-8?Q?LDFpskeO?=
X-Microsoft-Antispam-Message-Info: 1nxBK9uUnG4W4SyKA2nmg6nmgXWh7Wl05A4JB69qubyZQHf3LEuGNCnKYE2APGBLRvt1FeSLE1xQCUPTKfrsJcr+PKV4AuXRaTly6hrWVM9SXGlf7h8b5XbglC2FoTatVYJxoO2vX9hW8MFadtaXaGpIncM5cXbgWTEcojGma+SjWryyLJTpuMt74/XDufhO
X-Microsoft-Exchange-Diagnostics: 1;MW2PR1501MB1963;6:BlSU++EPTAA8aqGxU99+waS+uO+LL5A9NUMgNmQ6OFq6ba27YnA/46Drs2RadkarbijTxHWUUMIj3zrgOs8fyIzXr8Uk+IkDzQ3LF6Y4KJVq1m3LTyYZM1eRlhtcU2QloB2rbpnYSjc9QbqMVXZHzL+41NuH4VADB9mWS22kiMJohQuTwJzNZeLnNHqkHNa4NNC/enIgNtHn5FJjJsHwhX0DfobugUaw48nh878PO38x++rBu4wCZ72w05Q/U8pBT7vH8YRg5JhpBwHQZza8zpznwNa84UszTTLkhyvSrlSaHSu5JADfac/PBTJ0zJ2T9qXM/ECRyQ5bR9fPUDb3iXR8dg7ZcyPBCRCBYixHlOn8VvehJXa1EYCaM6WV2Fzbim0XC0E8VlccwWbxkvTzHQv6TeRQkvUq9E/nHR0vrWEhT/Bi/BmcZf8/ISb/KG78r4I9LkYLqKBZD/k80ESWSQ==;5:4WOYg8ZHklMZgerzpxm6mrwgO2lKJOaUoQXCSTqRcn+2bsfZOjevCiVDJbZTivFKKw22afBdJTVCOQNLpnCvbemABGIr3vdofv70uXCFLO9Ae4REzVyXDICNtmn4z/ONyW7cBUQ8Bs3xnzqlZpK9Hq4t99C5VjC0pHmNv5lKv4k=;24:XdDNke2+oZjtCzbG4WqQgR5YOZpRobUGCxJDS8cg7GEzImUgM6T1itgzneC7fkF5G53Rt35sj5+3ItMbM+Fo7IqC+g8ws4wMLEVhhMtHJ7Y=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1;MW2PR1501MB1963;7:HdkidGduKZ3e7ctsIEb79cS2QjaShfEX/vdrglbChU+Yn+H4vPNJs8mmRtTXQFSmERHY+FQx0xT1rwq3+/vj/om4+6jhuQYwIQdgr/jjOc+ZRU1XyS86a3f4R7gATiFBdEwXCibllOg2RSjeTUqzLgh61QLdDvI0cbDVHXVuOD5bBuwvAaCnJAQqo/VohEEYn0CkhRB8uGQWr0hsMTNFQtkQwc5jFeEIPayR1QOHaiCAuiEVwsJeemYNIGM0ldnc;20:16Q9sgCCxE3HFSsXY3L3wdmpjsRr4w5RK3YAQvr5qg0Wzgk+8wpQUh0J6lBInOeb/WS+von4VuOJG71Fe62K1FTkPde/y7w6LkWTZg3WQ5J6vZdAiPLrzk5zBeSGzPCLtlTX0GFvXw+tAZw4HM0FCwSeo+PWRZGTv2PF8LB9cr8=
X-MS-Office365-Filtering-Correlation-Id: f9723f95-8a68-45c2-2811-08d5c0b97e11
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2018 14:28:43.4882 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9723f95-8a68-45c2-2811-08d5c0b97e11
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR1501MB1963
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-23_06:,,
 signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/23/2018 10:26 AM, Alex G. wrote:
> On 05/23/2018 09:20 AM, Jes Sorensen wrote:
>> On 05/22/2018 06:28 PM, Rajat Jain wrote:
>>> new file mode 100644
>>> index 000000000000..b9f251992209
>>> --- /dev/null
>>> +++ b/drivers/pci/pcie/aer/aerdrv_stats.c
>>> @@ -0,0 +1,64 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>
>> Fix the formatting please - that gross // gibberish doesn't belong there.
> 
> Deep breath in. Deep breath out.
> 
> git grep SPDX
> 
> Although I don't like it, this format is already too common.

So? Just because some people did something wrong doesn't mean you should
continue to do it.

Jes
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
