Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AC7757E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri,  9 Mar 2018 23:41:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751347AbeCIXlO convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 9 Mar 2018 18:41:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38836 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751225AbeCIXlN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Mar 2018 18:41:13 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w29NepvM028034
        for <linux-doc@vger.kernel.org>; Fri, 9 Mar 2018 18:41:13 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com [158.85.210.109])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gky5x1x9u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 09 Mar 2018 18:41:12 -0500
Received: from localhost
        by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
        for <linux-doc@vger.kernel.org> from <miltonm@us.ibm.com>;
        Fri, 9 Mar 2018 23:41:12 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
        by smtp.notes.na.collabserv.com (10.122.47.48) with smtp.notes.na.collabserv.com ESMTP;
        Fri, 9 Mar 2018 23:41:00 -0000
Received: from us1b3-mail79.a3dr.sjc01.isc4sb.com ([10.122.105.126])
          by us1b3-smtp01.a3dr.sjc01.isc4sb.com
          with ESMTP id 2018030923405969-917346 ;
          Fri, 9 Mar 2018 23:40:59 +0000 
In-Reply-To: <20180307221124.GD10438@amd>
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a document
 of PECI adapter driver for Aspeed AST24xx/25xx SoCs
From:   "Milton Miller II" <miltonm@us.ibm.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        linux-hwmon@vger.kernel.org, andrew@lunn.ch, jdelvare@suse.com,
        arnd@arndb.de, linux-doc@vger.kernel.org, andrew@aj.id.au,
        gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Date:   Fri, 9 Mar 2018 23:41:00 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20180307221124.GD10438@amd>,<20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
 <20180306124002.GA13950@amd>
 <33bf6563-b220-7ff9-8b04-84e9bd781b3f@linux.intel.com>
X-Mailer: IBM iNotes ($HaikuForm 1010) | IBM Domino Build
 SCN1805107_20180220T0755_FP2 March 05, 2018 at 08:20
X-LLNOutbound: False
X-Disclaimed: 47211
X-TNEFEvaluated: 1
X-LLNXfer: False
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset=UTF-8
x-cbid: 18030923-3721-0000-0000-000002A5D22F
X-IBM-SpamModules-Scores: BY=0.037583; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.391525; ST=0; TS=0; UL=0; ISC=; MB=0.198820
X-IBM-SpamModules-Versions: BY=3.00008643; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01000735; UDB=6.00509053; IPR=6.00780065;
 BA=6.00005858; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019947; XFM=3.00000015;
 UTC=2018-03-09 23:41:09
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-03-09 19:50:14 - 6.00008166
x-cbparentid: 18030923-3722-0000-0000-0000B0C9D624
Message-Id: <OF08D8261E.8F72E5DC-ON0025824B.008218BB-0025824B.008218C6@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-03-09_11:,,
 signatures=0
X-Proofpoint-Spam-Reason: safe
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

About  03/07/2018 04:12PM in some time zone, Pavel Machek wrote:
>Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings:
>Add a document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
>
>Hi!
>
>> >Are these SoCs x86-based?
>> 
>> Yes, these are ARM SoCs. Please see Andrew's answer as well.
>
>Understood, thanks.
>
>> >>+	Read sampling point selection. The whole period of a bit time
>will be
>> >>+	divided into 16 time frames. This value will determine which
>time frame
>> >>+	this controller will sample PECI signal for data read back.
>Usually in
>> >>+	the middle of a bit time is the best.
>> >
>> >English? "This value will determine when this controller"?
>> >
>> 
>> Could I change it like below?:
>> 
>> "This value will determine in which time frame this controller
>samples PECI
>> signal for data read back"
>
>I guess... I'm not native speaker, I guess this could be improved
>some
>more.
>

I agree this wording is still confusing. 

The problem is that the key subject, the time of the sampling, is in the descriptive clause "in which time frame".

"This value will determine the time frame in which the controller will sample"

or perhaps phrase it as saving a specific sample from the over-clock, or a phase of the clock.

>Best regards,
>									Pavel
>
>-- 
>(english) http://www.livejournal.com/~pavelmachek
>(cesky, pictures)
>http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
>

milton
--
Speaking for myself not IBM.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
