Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 97CA37DE74
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 17:56:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752658AbeDQR43 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 13:56:29 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:59962 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751204AbeDQR40 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 13:56:26 -0400
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3HHnSvd001400;
        Tue, 17 Apr 2018 10:56:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=facebook; bh=Q4gbadQaEbRgss2lJf733LpfarB4Z3i9Tbg7Y2uzr/U=;
 b=m8pHN0tcDTS2X9bQG2p3swIjMt/u9nAecRFYRJNT78rOqi0N+L+KrkTSzrVCcdsi5eNv
 MvABTtO7n+c+8nHVj7riDkaz52fRuglnRpudtnYRYbepV1Ait17ti5VkTSTWXoxoOUjW
 SQnVa9E+fluayGbQrRqsuFemYPaa1IF6VxI= 
Received: from maileast.thefacebook.com ([199.201.65.23])
        by mx0a-00082601.pphosted.com with ESMTP id 2hdms9069x-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 17 Apr 2018 10:56:03 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.25) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Tue, 17 Apr 2018 13:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Q4gbadQaEbRgss2lJf733LpfarB4Z3i9Tbg7Y2uzr/U=;
 b=NajsyskRx3Jy5lYKzbRUo9cmM1/FdNW22gCKG066SwluZHkpH4DlL/XRvK1xke+uE5A/v7FKoGiKt2//4ipI09/84/U5l2l8tmu/IjR3m81DO0TZCOz+S1/Pyjx4/g0LUe7p9xxw/FdlW6UR/3FBGfbw2M1kYBwlQzlD5S3GNTQ=
Received: from localhost (2620:10d:c090:200::6:59ad) by
 BL0PR1501MB2036.namprd15.prod.outlook.com (2603:10b6:207:32::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.675.10; Tue, 17
 Apr 2018 17:55:34 +0000
Date:   Tue, 17 Apr 2018 10:55:29 -0700
From:   Andrey Ignatov <rdna@fb.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
CC:     <daniel@iogearbox.net>, <ast@kernel.org>, <netdev@vger.kernel.org>,
        <oss-drivers@netronome.com>, <linux-doc@vger.kernel.org>,
        <linux-man@vger.kernel.org>, Lawrence Brakmo <brakmo@fb.com>,
        Yonghong Song <yhs@fb.com>, Josef Bacik <jbacik@fb.com>
Subject: Re: [PATCH bpf-next v3 7/8] bpf: add documentation for eBPF helpers
 (51-57)
Message-ID: <20180417175529.GA68667@rdna-mbp.dhcp.thefacebook.com>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-8-quentin.monnet@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20180417143438.7018-8-quentin.monnet@netronome.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Originating-IP: [2620:10d:c090:200::6:59ad]
X-ClientProxiedBy: MWHPR19CA0056.namprd19.prod.outlook.com
 (2603:10b6:300:94::18) To BL0PR1501MB2036.namprd15.prod.outlook.com
 (2603:10b6:207:32::18)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);SRVR:BL0PR1501MB2036;
X-Microsoft-Exchange-Diagnostics: 1;BL0PR1501MB2036;3:TjP5Z5oU9IcQU+W83jOYXe6pxwElN7YBIaWOgIWQFvKAiKkQEcTnuCVuCMX/18GpqTFXHEyzS5KYy1ctIF7k1CIWxRGdAxJ0yqGkqASJevZGudkw0HgaEKnrlL3EoQVyJOsn3YuzSXxG6ec5tpClOjfsz0hoxB/kNgshjjIP8WBNepRSzemIelw50nl/9V5I8P0KUqjIK8pkUJc5C5xU3CVv792zlRB5jUGppaeD7Js3WZmifN9PtrXfVZx7mpd2;25:lkgsxqFVb3zSV3+Ak6SCbX4GpURkbzrXGgkLk4dNCCd8hh1iiE54BaQKAr4YeeRld5yCBHsvSqChCugbXSLxrGi4XZlOAw9fCeiNiszYpP8gqMl+QD65IHhkkHu98havEVwsWaiF2RmDi0c1bmA7RzR99PX6DBllpHNrvDdWQaoECP4jaL9My5hzEuTnn6Flyk+eK8sBtvjSY8CcHlYN2c4Lb6TJ4bvaVyoN1F01uChi8W2cbCR0i7njy4MkSuRzjulir/v4+5MlDhi1xdmmQzZoZoYfnapQm2EhIvtiC3mLJqpJwrXxb3vM6AlosoliwKBMeIMZ7v9h2JtPXRFlCw==;31:cQLHeOZ2u2iAg+FeXz5Cyjk1XnD+IQGz9crjiBulzzus3vjOvgWPcoyy3Sh15hmJdDy9XKzc4gWCZkpYPwibOyLw/k2I/GyEJKR2GqwJ0eevQRbLRMKo7eoaBUBcXCVu+VKC2gOhJdw4a0K9cvgOIHKS9EqrfGqkMODt9fmUhWDBj0/O4yNUgFa16dgzdiMwop2u9rEce7vg6LVxfAXupKf8ZINSuuvc9brv8xqBz1g=
X-MS-TrafficTypeDiagnostic: BL0PR1501MB2036:
X-Microsoft-Exchange-Diagnostics: 1;BL0PR1501MB2036;20:saPkG4Wjomm2rawsLMMZGzLL4b2fvotYc2PoUMKohyRwIEZriM+g0vKqAU1seIhbnHBjB2cMGienf1+PzsXol4q061TbGiHpB5IbuwtN+z3rE5VNVM2rSCykMHzUgvoVtBVIfsYTfPtfLF6eWsZU8CrkDfVxCxjKy0KUPnIgiXxH30c+16x8ojGLOxmP4lpiYf2j7/N9REztYT7oE36fcrKwBmllZIQkT31Eua3es+q5ux8x+i/VP/ndoETWSJAtYD4D+ybo25+zGg5rV1duu6+Vr85pGd50HJFXtdOu6fnC3dW6xEg+JaFsfhngcLqE2lnogKiMfx9LptKeMqtH+Ur7ioToA05bl/mNmhkNM+Fk9yrUcnwq26goxx27hQyEz4Vugjfcza7TwsZj8MtlBv+r82towKZYaW/MKRnYPpsPRtJNtvBoY93QNbI7Ocl6ypK9cY/0tsFu0dsUiuBuI5oCFEnKXBTG517zAZJSYe3HIZ+/pDVFoCwowB0RKjxZ;4:X61EETnDKRdQNLZEFHCT8ZBmOFrCt7grw/ibikU4549wzJwj6Zf2/qxHO/V/fImAJ4YpRXULImZjSPnptmY31mUx2aQzgl4ZK6iCak6ywWQ8T6bUV+t+jg9UoSRsXoGyfcuHh8sfAWJs4gLmiayHFMzJXVhpzqpJbsspROq47wEEMNff7op0fUb4OfjUj4FnIzBYYYdMmsQ2HXKuQngIaa3LnoSxmXXxDhqTegvFnJwicvP5RT65d+cdxurGfY52wxrqlq7ZV2mZmkJIwD6KC36u7dfE5ssuAT4/tANy/ZTyUkvfp/0jk0XzUKa7t3/3utawYmjqVQXxmwZZPJ/EnyoWeAYm9BeEyj9MKJeJLAg=
X-Microsoft-Antispam-PRVS: <BL0PR1501MB203601D32180F811369B8755A8B70@BL0PR1501MB2036.namprd15.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(67672495146484)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231232)(11241501184)(944501359)(52105095)(6041310)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);SRVR:BL0PR1501MB2036;BCL:0;PCL:0;RULEID:;SRVR:BL0PR1501MB2036;
X-Forefront-PRVS: 0645BEB7AA
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(6069001)(39860400002)(39380400002)(376002)(396003)(346002)(366004)(377424004)(189003)(199004)(8936002)(68736007)(186003)(5660300001)(6916009)(16526019)(6666003)(50466002)(305945005)(16586007)(6486002)(316002)(7736002)(54906003)(486006)(58126008)(446003)(11346002)(1076002)(476003)(229853002)(46003)(6116002)(106356001)(105586002)(2906002)(76506005)(52396003)(39060400002)(47776003)(97736004)(2486003)(23676004)(33896004)(52116002)(52146003)(4326008)(86362001)(76176011)(6496006)(6246003)(53936002)(478600001)(59450400001)(386003)(25786009)(33656002)(81156014)(8676002)(81166006)(9686003)(18370500001)(42262002);DIR:OUT;SFP:1102;SCL:1;SRVR:BL0PR1501MB2036;H:localhost;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDBQUjE1MDFNQjIwMzY7MjM6Wit1TjJrVmxZZUFLczd2TGNXUVpUTHpZ?=
 =?utf-8?B?REV2L0FoMEs4SGFHd3gxTlpaUlllblRLTFJZZ0FwYTgrbitFNlY3T1JLMmhQ?=
 =?utf-8?B?L1ZqeWJ0dzlocDFyVXZMcElhU1FvcmNpMzR6ZytpcjVvcDV6QTJldlh4TE16?=
 =?utf-8?B?UFQzREo1Zm9WUmtJSk9nWTZaUzRnb0wyeWk3MzY4RFY4NUxWNUFWVi90UXpn?=
 =?utf-8?B?WElkdVk4dVA3WWREb2U3SlJYVXBTNlFJcENwNVdQd2MraUFJSFh5L1c5TzBj?=
 =?utf-8?B?VmdnRXBuV0V4bHJWQndCbldNTE1MNUdmMnVody9zSUpJV2R5TVc1YUdMNTVt?=
 =?utf-8?B?NDBTWHNjZHNlV1hQOVRIdllUblU4RFE5ZEYwQ3JTdXFHcE9aTXNMSHJlSDJm?=
 =?utf-8?B?RVcxNmt4c1dsSFd2WVBBMTZlb211Wnh5Y0lKWnlTajVZSmZWYjFGTFFBSkc1?=
 =?utf-8?B?RC9kYmZheVdOSExhaEFBT1Y2b0pjWkd3Y2p5NGJXNHlhTy90SExkV3djZEIy?=
 =?utf-8?B?Yi94VUFoQXFpLzZ5Ykw4V0xNQzl0UHFIL3dhenVRUlI5c29TYUpsQm8zYXh5?=
 =?utf-8?B?KzJGYW1OR1dpMWJlR3RRVzRBWTFZa1VieFhjRngwY1dVM2R5SC9Gc1lTTytW?=
 =?utf-8?B?RERlNnh1c1JlaDlORXhTTWRwRUJpZlB3bE1zZGNRWmppcnNVaEZxd0krcFJL?=
 =?utf-8?B?THZxNlNpc2ZEQ1FWWStzM290SXVudmlQeXp1ZXVNSDBCamI3RmFIR2JSczQ1?=
 =?utf-8?B?clFock9uOUxWQlNMZGJZeU84aWlQTnk1OHVCbU96MGdsamlCTktObDFzQ2pG?=
 =?utf-8?B?Qzh3aFVTcVhwczREbWRVWW93UE1GdmhjSURDTTEveWhCMlEvSjZRQ25CTlBh?=
 =?utf-8?B?akNhQ0l5REJsMTVPdFRnYkpYdXdiNE92bUtrVVBzY3lCV2lwck1DY2FvaDZn?=
 =?utf-8?B?MEVTS05pUGJleEYrQ3J4TjdzZDg2Q3pyMC9sWFNwRlprd1VrUGZNZ2Q2Mmtj?=
 =?utf-8?B?WldTREZVUTZQbVA3M2g4SjdRZlJlM3NnMkpDc3ZMdGNoMGw5MkFQL1BUM2wz?=
 =?utf-8?B?YlltZmVoYW5wdU1QY2FlY3A2ZmUrRVhEdmYvZ0lQclJEbU9vK2tQUlVURXhL?=
 =?utf-8?B?aUpWMUFXbVNHaUVCWllHOVlLRERVSTg1Y3NNTTE5YVVNbFVrK01sMlh1T3Zv?=
 =?utf-8?B?VzIvN3lXbVVZOVROUEZoWHBUY1pUOTBjOVhaLzRhcVp0QnFRR2ptQThDYnNC?=
 =?utf-8?B?RytTSElaNXkxcVd1aURCM1ZMSVljMDk4Q1lZUXZ0K3ZrTmlJeDBvbjlqWjE0?=
 =?utf-8?B?dUUvcGs5Q3Y0bmVldFpDTDQ4TkhrNk96ay9LRTJxVVJTKzY1SDB5UzkyUDRj?=
 =?utf-8?B?c05nbDRiam9Uc1prZkoyVnhMOFJ6N3F2VHZEKzRyeGVOUGNNMW9LU2I4UWJO?=
 =?utf-8?B?NDdpUWo5WkNWYm43MWowYnNPL1ptaXNPWFlHZUs3R2hOQ0kzSTR3LzVHejUr?=
 =?utf-8?B?eEJ0YTVuUnNXblJPUWRUL3JiVUNadzVJZFNWTUxrQ3dhKzFpN0luVUdyY09s?=
 =?utf-8?B?Q29IbGxBRGdNZS9iUTRwS0wyK3dwUXhtMjlYOStPVDIvNElHUGZSaXdsK1ZO?=
 =?utf-8?B?cEJrbVJxTHNEYno3ajFPbHdRUW0xeVUvWktMYkhmcEJsR2VHNTBPZmxtTGFk?=
 =?utf-8?B?R01OcHRvcmUwNTBQbTV4ajBTTHB4Vm1iRjdtcDhwT0RrbFMyNmN2WW9ITHV0?=
 =?utf-8?B?a2Y0VzZ3dXRNNlVpelY2Z1JCWkRib3VSZUJmbmlUaDJ4Sy9CbWxoRWRaK1o5?=
 =?utf-8?B?ckVseTJvM3kwaFFqUGZ5cFIrc3U3eXRIRTRmVzdZbVJHR0xXbmhERno5UXdB?=
 =?utf-8?B?YjNXSmFBNjQ4VnZzTUhXSms3TGxyWGtPTUNibzNCeWJCNGNjN01JQTRodk84?=
 =?utf-8?B?MlczZ1hmKzFzRFE9PQ==?=
X-Microsoft-Antispam-Message-Info: tksO52vNTCmz3dAdr0rE642IUWMCJtG/N1GkZmWiAom8QFkj+t7onDb8T1FfSLENOfnyifmmlUtYrHoogwQdW8KgDg6walNOTGnHXNkXUkaKiUqR9uLRUhkIRe6unfOVqoDl2wXqYnEwbBG6I9gqLzJodgGLwJVHmr6g1tTIE4g4xu15wUP0xmhyN03n3P18
X-Microsoft-Exchange-Diagnostics: 1;BL0PR1501MB2036;6:svmOdUw/BQN40DVQd12wK2aFKm9lED/JW9Y3QXgtBryWPvtbTRBLPNmj7igghZiesfB7NI07CiC9E2m4snMcb3RbqbeaLP9LrafWRYM827b1KRTqWBkFP9+oIlMnCsWJzOAOMeBrlHdg/HTbNSieKl0pYd87uac41xpQItg5ADgYryW6qsq0IGaYsHkDK/+wfnLW0U/qZ6O2VJaTsDPtgHNrDjSHo/26wr8iIrQNS26hEcmf3etWDILk0zV2jcSruk9dUSH1+xr2XhIIEgS9EVQ066ExTjVFu9i4iWp5VPRiIZszLc7oBpV2Q8HhfM0pooFp4VvGQyBI8eLSHM48rL4+bHDpuKIiIEIZ+pFAedSHzBA50jICY/SJiUkW+IjCt5S3hW7orDGeKLnwabc7utFn5sEPhn/906A2Pns8xX6cUuA7WkZpQOB6Y4/JWMwh5eWX9Oq5QHY0eoVgUIUXng==;5:FfB75Wq4hQIxhzSMaxV2JGpw7Obua5virVHBguBFW3MPZ2jzmrqfdCbz9/mMG8m6eYUkvyFHNyRAlXf0yhj0HgNwZpVIPy+Rd4bkHwuAN8BL/vlrsDrIwGp+0NO0r7rwwvjJU8KBSpWow7vQyObU0C0NB9B1fruT2PAPyY02Buk=;24:PVeWhKLkyeo3QpUCoa6Qb5xtN+QNsLq4PQ8YkBIusJe1q9eywJKEI3JTXTyk5z0yGCrGclbnZIXL5WbJKot6CewRBecgcr7nnW8IodyDxK4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1;BL0PR1501MB2036;7:6sUBJ7efm3AcQClhxGDmR/2IXwZt3THC71MIZvP3+3smKYedwMjuw07WXM26Q7OSUkZhcueGOyKWUCHpRzYwe3ZM6GtM6t2V84HqO+CslkhfC14kiZnYftjFS/d+MggsW9zqcccNgU9sk1EQdikbnfrEV8JbH68/SEmdsB5LLulEWYn2jw+mEHK/UDaNB3UFXglav6JJrG3RrukyranOrPHqj/YWvt0e50HQN+P11ErNYOw6ysfd6t5l3ClFAK8H;20:hFANlYJScS0LvBqb3g9F63WVyNPjdXUYyy4S5oSTgRSsFU6cnXHJ4RPEMRWcSFfdamW1Q6574wpXKGSkM7x+9ysSkuQkygH0KCq+ASHTu9lxgL7vW29hlG4iw6908YSgVk8OlmZl7cwN0O/BLsRHQHQ/0JOSL0T+0aO+hl+vGKk=
X-MS-Office365-Filtering-Correlation-Id: 74f5bb16-c9c7-4a12-28c9-08d5a48c6b5a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2018 17:55:34.3896 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f5bb16-c9c7-4a12-28c9-08d5a48c6b5a
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR1501MB2036
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-17_09:,,
 signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quentin Monnet <quentin.monnet@netronome.com> [Tue, 2018-04-17 07:36 -0700]:
> Add documentation for eBPF helper functions to bpf.h user header file.
> This documentation can be parsed with the Python script provided in
> another commit of the patch series, in order to provide a RST document
> that can later be converted into a man page.
> 
> The objective is to make the documentation easily understandable and
> accessible to all eBPF developers, including beginners.
> 
> This patch contains descriptions for the following helper functions:
> 
> Helpers from Lawrence:
> - bpf_setsockopt()
> - bpf_getsockopt()
> - bpf_sock_ops_cb_flags_set()
> 
> Helpers from Yonghong:
> - bpf_perf_event_read_value()
> - bpf_perf_prog_read_value()
> 
> Helper from Josef:
> - bpf_override_return()
> 
> Helper from Andrey:
> - bpf_bind()
> 
> v3:
> - bpf_perf_event_read_value(): Fix time of selection for perf event type
>   in description. Remove occurences of "cores" to avoid confusion with
>   "CPU".
> - bpf_bind(): Remove last paragraph of description, which was off topic.
> 
> Cc: Lawrence Brakmo <brakmo@fb.com>
> Cc: Yonghong Song <yhs@fb.com>
> Cc: Josef Bacik <jbacik@fb.com>
> Cc: Andrey Ignatov <rdna@fb.com>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> 
> fix patch 7: Yonghong and Andrey
> ---
>  include/uapi/linux/bpf.h | 178 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
> 
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index dd79a1c82adf..350459c583de 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> + *
> + * int bpf_bind(struct bpf_sock_addr_kern *ctx, struct sockaddr *addr, int addr_len)
> + * 	Description
> + * 		Bind the socket associated to *ctx* to the address pointed by
> + * 		*addr*, of length *addr_len*. This allows for making outgoing
> + * 		connection from the desired IP address, which can be useful for
> + * 		example when all processes inside a cgroup should use one
> + * 		single IP address on a host that has multiple IP configured.
> + *
> + * 		This helper works for IPv4 and IPv6, TCP and UDP sockets. The
> + * 		domain (*addr*\ **->sa_family**) must be **AF_INET** (or
> + * 		**AF_INET6**). Looking for a free port to bind to can be
> + * 		expensive, therefore binding to port is not permitted by the
> + * 		helper: *addr*\ **->sin_port** (or **sin6_port**, respectively)
> + * 		must be set to zero.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.

Acked-by: Andrey Ignatov <rdna@fb.com>
for bpf_bind() helper.

-- 
Andrey Ignatov
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
