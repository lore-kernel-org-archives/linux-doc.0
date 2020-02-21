Return-Path: <SRS0=i7Ry=4J=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C31FC35669
	for <linux-doc@archiver.kernel.org>; Fri, 21 Feb 2020 21:33:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8086206EF
	for <linux-doc@archiver.kernel.org>; Fri, 21 Feb 2020 21:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Sony.onmicrosoft.com header.i=@Sony.onmicrosoft.com header.b="Z+R/GqP+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgBUVdj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Feb 2020 16:33:39 -0500
Received: from mail-dm6nam11on2139.outbound.protection.outlook.com ([40.107.223.139]:54873
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726683AbgBUVdj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 Feb 2020 16:33:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2in1rVCyZXRXiVuqqOI3PrUXac/XalxHnCrdeVVU+DcEA6CJbyUXtq2TJVN3AD2rVi1Nk9t9U+lTvTpuTIjWSQfmMGL0d/doXtiap49WCSeE+S2iZfjjkGcQ2KGFqt3noHjTT21kAyxKLXmabwBC/o+qZtvYuWqj6PHGjUUGs2ms4OrkkcQNRcUO3bTPYqERcP8WVytSufDyoGicu+olpQWietIJSancQ/zT/WupV8mYDEpb9m5ZwLSNkxT38EliMJBddthbHvT6QvkQYWfkf/uSoMB8KlN/m8/XyLxmy1lfoYsMsPnGGgiWsJoR4yX9E+fJ6oZ3YsaKhw+yH/J2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMDayJy+MSYwlHeaHf1d7X1UCJYzfHigK6+DEqjNjsI=;
 b=RkoSs8Pv5mxMEQCAujXFnsinjnYCm/ID/T7DmRgNFJNB3R4n/Rj8ClxdIqGsa6Zo16mJEi+6y7QpXgOSejjNADVC+i6oxdxAwb4I0vCOhTK7FSnKOqnln2cTSnwdkyYxUTqplwyC3QpfU9sWOzg7/Wa1rbAh/vNxsHNsTtyNrOuvzJJSF4wpL/MRS8AUUXeG8NaGWFO+E+2vftpPQvTMRZrOBYPrB+Fk8ujhU0ZmMoags37SmxJgfT0Og9g6hjZPaKQaMEjuUYVb7Ijm7QT5/tzslxTra3r1q+QWICy9vGnH6mOk9XooDmXDC4XdxxM0be3wzDdijV+gX6jer4lB9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Sony.onmicrosoft.com;
 s=selector2-Sony-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMDayJy+MSYwlHeaHf1d7X1UCJYzfHigK6+DEqjNjsI=;
 b=Z+R/GqP+z668bimYYePdXdc00QnLAX0QCOpKx2+JpAWKICQW6BbZSkJjSRPzP/KjNtQs+8mJerFEOv8fmvBSNdxRdVOY9XLkzN5Wg//VjGw46XL0dXWTtfEAQ7SILj5CRc8H170kruu8FXucmmrB0XCgDJbt8B6jCfvf1VRD0cI=
Received: from MWHPR13MB0895.namprd13.prod.outlook.com (2603:10b6:300:2::27)
 by MWHPR13MB1662.namprd13.prod.outlook.com (2603:10b6:300:12e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.13; Fri, 21 Feb
 2020 21:33:36 +0000
Received: from MWHPR13MB0895.namprd13.prod.outlook.com
 ([fe80::7544:fc2:b078:5dcd]) by MWHPR13MB0895.namprd13.prod.outlook.com
 ([fe80::7544:fc2:b078:5dcd%3]) with mapi id 15.20.2750.016; Fri, 21 Feb 2020
 21:33:36 +0000
From:   "Bird, Tim" <Tim.Bird@sony.com>
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "lnux-kernel@vger.kernel.org" <lnux-kernel@vger.kernel.org>
Subject: RFC: Fix for sphinx setup message
Thread-Topic: RFC: Fix for sphinx setup message
Thread-Index: AdXo/pF+8PHJAoFQStyciWUNVBwIKA==
Date:   Fri, 21 Feb 2020 21:33:36 +0000
Message-ID: <MWHPR13MB08957573C6B5249A0AF7CF81FD120@MWHPR13MB0895.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tim.Bird@sony.com; 
x-originating-ip: [160.33.195.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9647f570-54f8-4c44-f400-08d7b715b594
x-ms-traffictypediagnostic: MWHPR13MB1662:
x-microsoft-antispam-prvs: <MWHPR13MB1662CE8D78CD5C2F3B21C078FD120@MWHPR13MB1662.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0320B28BE1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(189003)(199004)(86362001)(478600001)(110136005)(7696005)(966005)(52536014)(316002)(186003)(5660300002)(6506007)(567974003)(2906002)(26005)(81166006)(71200400001)(66556008)(55016002)(15650500001)(81156014)(8936002)(64756008)(76116006)(33656002)(66476007)(450100002)(66446008)(66946007)(9686003)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR13MB1662;H:MWHPR13MB0895.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sony.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xdPmSP6i1KD7fmfL4gk+Pd869nir9+EkgIgBAqa/Sjmnp1Zqjh6UMBL3M8YdnZMpGaoEU6osDMuCp7R4husKmxV70YXxQdcbnmLgoYPwZNrJ7dhiK40OTZxM2OdLKG64pOunu9Rntzo1was5e13Vkzwhcz3xi5JDJk6r+NLZtkYV3lXT+/LRRtK7W5opJNSJxLnBX83OqdlEe+ZL1KApwraywAXQ0TxehRUBTZ2xaKNdnPCywTJh9muEntWUgpWgzI6PksmlDY9lRby75kjyb+mYIxydY/pb0bAigL3JvKfgxLhMJKDnfFBvP9sGtsdRSbCC7pF5dhxKfCMV1RNX5bKWISUUI/m9JpBfoC0VBjKayJCzjKpTUSHAaTGUnTZj72ObwcEgsCss8f9VSecVvfvTpsgdUaIt+XgZrymRiFDQhupLpuOpduxukYxFcUAqpKkvndn4QxFE5URsedH9ZCwTRz79TBwZ20NkWUWxNd7r2AZrvZ3ibBwGB76BQnBDo82uEYR6w3dckoJ6W2aY/g==
x-ms-exchange-antispam-messagedata: P2QWIwdu8pkv6t3caIPVpiMR+nOzRpJUQVXR+v2xAGhILQ5bb+IgkhYcmOw8Z4OXTHgwiCbX8bdZbdNEPmKz2Mc63aDXyKuIPWcWE5lScT/Pa5e1dfkbW+1gpCvGJ0X/+wAnyGzh5Tm2+Q96e3OkXQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9647f570-54f8-4c44-f400-08d7b715b594
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2020 21:33:36.2589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rSdgkR3DG+6QZFWpJkzWOIIL9I4SgDkpfczPrRMTRVS4vn9P3NXE/A+US2Knba0DG4NMz6TBQJPSlysF3iTtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR13MB1662
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I was trying to set up my machine to do some documentation work,=20
and I had some problems with the sphinx install.  I figured out how to work
around the issue, but I have a question about how to add the information
to scripts/sphinx-pre-install (or whether it should go somewhere else).

Detailed messages below, but the TLl;DR is that I got the message:
-------
You should run:

    sudo apt-get install dvipng fonts-noto-cjk latexmk librsvg2-bin texlive=
-xetex
    /usr/bin/virtualenv sphinx_1.7.9
    . sphinx_1.7.9/bin/activate
    pip install -r ./Documentation/sphinx/requirements.txt
    ...
------

The pip install step didn't work, and I found that I needed to have everyth=
ing
based on python3 instead.  When I replaced:
    /usr/bin/virtualenv sphinx_1.7.9
with
    /usr/bin/virtualenv -p python3 sphinx_1.7.9
everything worked.

This message is coming from scripts/sphinx-pre-install (I believe on line 7=
08).

Should I go ahead and submit a patch to add '-p python3' to that line?

Are there any downsides to enforcing that the virtualenv used for the
documentation build use python3 only?

Thanks,
 -- Tim

Gory details:
I'm running on a machine with Ubuntu 16.04, and I have both python2 and
python3 installed (with /usr/bin/python linked to python2.7).

When I tried to do:
$ make htmldocs
I got the following messages:
...
You should run:

    sudo apt-get install dvipng fonts-noto-cjk latexmk librsvg2-bin texlive=
-xetex
  =20
    /usr/bin/virtualenv sphinx_1.7.9
    . sphinx_1.7.9/bin/activate
    pip install -r ./Documentation/sphinx/requirements.txt
    If you want to exit the virtualenv, you can use:
    deactivate
---=20
Following these instructions, at the 'pip install' step, I got:
$ pip install -r ./Documentation/sphinx/requirements.txt=20
DEPRECATION: Python 2.7 reached the end of its life on January 1st, 2020. P=
lease upgrade your Python as Python 2.7 is no longer maintained. A future v=
ersion of pip will drop support for Python 2.7. More details about Python 2=
 support in pip, can be found at https://pip.pypa.io/en/latest/development/=
release-process/#python-2-support
Collecting docutils
  Downloading docutils-0.16-py2.py3-none-any.whl (548 kB)
     |=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^| 548 kB 2.2 MB/s=20
Collecting Sphinx=3D=3D1.7.9
  Downloading Sphinx-1.7.9-py2.py3-none-any.whl (1.9 MB)
     |=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^| 1.9 MB 30.7 MB/s=20
Collecting sphinx_rtd_theme
  Downloading sphinx_rtd_theme-0.4.3-py2.py3-none-any.whl (6.4 MB)
     |=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^| 6.4 MB 25.6 MB/s=20
Collecting alabaster<0.8,>=3D0.7
  Downloading alabaster-0.7.12-py2.py3-none-any.whl (14 kB)
Collecting Pygments>=3D2.0
  Downloading Pygments-2.5.2-py2.py3-none-any.whl (896 kB)
     |=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^| 896 kB 35.1 MB/s=20
Collecting Jinja2>=3D2.3
  Downloading Jinja2-2.11.1-py2.py3-none-any.whl (126 kB)
     |=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^| 126 kB 26.2 MB/s=20
Collecting requests>=3D2.0.0
  Downloading requests-2.23.0-py2.py3-none-any.whl (58 kB)
     |=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^| 58 kB 774 kB/s=20
Collecting packaging
  Downloading packaging-20.1-py2.py3-none-any.whl (36 kB)
Collecting snowballstemmer>=3D1.1
  Downloading snowballstemmer-2.0.0-py2.py3-none-any.whl (97 kB)
     |=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-^=E2-=
^=E2-^=E2-^=E2-^| 97 kB 1.1 MB/s=20
Collecting sphinxcontrib-websupport
  Downloading sphinxcontrib_websupport-1.1.2-py2.py3-none-any.whl (39 kB)
Requirement already satisfied: setuptools in ./sphinx_1.7.9/lib/python2.7/s=
ite-packages (from Sphinx=3D=3D1.7.9->-r ./Documentation/sphinx/requirement=
s.txt (line 2)) (45.0.0)
ERROR: Package 'setuptools' requires a different Python: 2.7.12 not in '>=
=3D3.5'

