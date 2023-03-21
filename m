Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE649C7619A
	for <linux-doc@archiver.kernel.org>; Tue, 21 Mar 2023 16:38:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjCUQif (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Mar 2023 12:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjCUQie (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Mar 2023 12:38:34 -0400
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6493A86;
        Tue, 21 Mar 2023 09:38:32 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32LGc0B1129243;
        Tue, 21 Mar 2023 11:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1679416680;
        bh=uyW0ma/g/TPpcz9cP3XZ4eMHjClm1JYyRJYyObimbRg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=TEpHALzKK4737cd+fev5B5J6JQaHQMk+tWpOOvSdWkkBlEnr4c4PSsLHKXOWJzzck
         Kd43hsjF7hkzFqtOW3gCaIYBzbtNwn7UBKzTM3pvDHzgCrDHRukL3D4OPupOLTxrPx
         O0MTJAvXeDv97FVNtLJWKvREJTv/eqNdjkJX5DVc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32LGbxa1067846
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Mar 2023 11:37:59 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 21
 Mar 2023 11:37:59 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
 DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
 15.01.2507.016; Tue, 21 Mar 2023 11:37:59 -0500
From:   "Sterzik, Chris" <sterzik@ti.com>
To:     Rob Herring <robh@kernel.org>, Julien Panis <jpanis@baylibre.com>
CC:     "lee@kernel.org" <lee@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "corbet@lwn.net" <corbet@lwn.net>, "arnd@arndb.de" <arnd@arndb.de>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "derek.kiernan@xilinx.com" <derek.kiernan@xilinx.com>,
        "dragan.cvetic@xilinx.com" <dragan.cvetic@xilinx.com>,
        "eric.auger@redhat.com" <eric.auger@redhat.com>,
        "jgg@ziepe.ca" <jgg@ziepe.ca>,
        "razor@blackwall.org" <razor@blackwall.org>,
        "stephen@networkplumber.org" <stephen@networkplumber.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "contact@emersion.fr" <contact@emersion.fr>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "Kumar, Udit" <u-kumar1@ti.com>,
        "eblanc@baylibre.com" <eblanc@baylibre.com>,
        "jneanne@baylibre.com" <jneanne@baylibre.com>
Subject: RE: [EXTERNAL] Re: [PATCH v2 1/4] dt-bindings: mfd: Add TI TPS6594
 PMIC
Thread-Topic: [EXTERNAL] Re: [PATCH v2 1/4] dt-bindings: mfd: Add TI TPS6594
 PMIC
Thread-Index: AQHZW0Qu2zDSQUXVm0moss4cLgsF5K8FbWcw
Date:   Tue, 21 Mar 2023 16:37:59 +0000
Message-ID: <edbd9ccae2fb4d18b50d99123246cb03@ti.com>
References: <20230315110736.35506-1-jpanis@baylibre.com>
 <20230315110736.35506-2-jpanis@baylibre.com>
 <20230320155354.GB1733616-robh@kernel.org>
In-Reply-To: <20230320155354.GB1733616-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.38.185]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>> +      A multi-PMIC synchronization scheme is implemented in the PMIC de=
vice
>> +      to synchronize the power state changes with other PMIC devices. T=
his is
>> +      accomplished through a SPMI bus: the primary PMIC is the controll=
er
>> +      device on the SPMI bus, and the secondary PMICs are the target de=
vices
>> +      on the SPMI bus.
>
>Is this a TI specific feature?
>
This implementation of SPMI bus is a TI specific feature and is only suppor=
ted between devices which have this specific implementation.
