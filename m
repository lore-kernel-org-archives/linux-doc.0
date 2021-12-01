Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171EEC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  1 Dec 2021 20:32:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbhLAUfn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Dec 2021 15:35:43 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:52510 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230376AbhLAUfn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Dec 2021 15:35:43 -0500
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C292EC506A;
        Wed,  1 Dec 2021 20:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1638390742; bh=CD0G7b2xNnaVEWo2QMfU/CiAedg8nvdVf9XX3FPBufw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Y3VXUVAD2/yPOmfWqNeprVOFUbxy/bTG7QpGS+SrBvJmbvPJnEbdFyftObPbeiqGM
         OHGC3+wp6fd8v0fKvUDRmmAyGpzppqZYUJyBbJ2fNXLI1CQ0Q48Beg6Omp9weR51ei
         /1o310SL6+B2GwQoN/5edLJQOFB633BmM8su/4nYKy393VVNXENor6BUQQBr7EmTly
         Hx+Xt/y5rr8/AtwLp9WwPEvpXRx28BPg1g5Vqg1tKiLiEaVx6onxp8PmzyTHQ/ZBty
         NO3vtKjfQo9VOLIgAHeCSUUCUns7STYwZC4wR7zJLoBUsWotNrmbWfMBiIfIl99Nn8
         LeL7ChfWEHt0w==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3C1FEA0081;
        Wed,  1 Dec 2021 20:32:19 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6B1C580056;
        Wed,  1 Dec 2021 20:32:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="KusSkh04";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1x2Mr5BA8Abya3B+S6XC3XZPihxh+mQmWWeKiKskPZGlRk/c0VF+eRmQWL3DTgHZQH9try909mfHomGbBim+KBsoC6fS0ixuimM5Uh3hRBFoUSwu5dnJA/GbUHyOw91LZNH9FeXiAIrvBDIDDB6UW5I9pwiLomMVg4zOXoRGJyMqNHvRx3C6R4+Qk8zWjt1S4rAvGrPMG4M1V86kqpCEoRjlY4aZMfFgzBHKzMn7yywM+NhtgjG5kZbAeDzD3us/uCdNdsAXb2s6MsUhsbJ9SXObp2Xj+pYuPTnfutye9MD5U5/2f7YDPzHD6BE3ql/4pvWW3Wpe689IIrRWOvxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+lhztOxWi0vQHm7dlBZJNE36dya6Iwj+aCJoamGbuQ=;
 b=T7PTxnyIyL5SuAjOZpaVcs34rAM1vT7DV87rn7MjkC+yYZUrlPBkcD3+jP8WguSFFqfAib4W05OMRpNdmROE5Y7RJ4TEP4LNPFvqgJxbud1l///vn5xh5U2q24q6zTnheEBNNTBRwzZMolBagUOAE5ftKvSP53G5cfvFy1ycEhxEwJKR0rCXGeN3Owtf2xPIJP8c4qgqzGkXU3YVNBo3l4gWbuZMRQEXg8fCURqSog+AqKbk/K7V1FIQKaKI4z4Qa64ZWdZVUX72KMleUpOchMWhfSTdKqTAENMIXeV93PLczzYQ0okO4b9CfdUhvZvq+oQtFBVaTa5k1DyrQ4VjVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+lhztOxWi0vQHm7dlBZJNE36dya6Iwj+aCJoamGbuQ=;
 b=KusSkh04ryLPttohH0yBdZ+6g0VLjtc2f/2x7ijCGSTAAYtMUSQ5V+o6ZSxtz7BdCjd6mgTQs6vkI3YiBwCza5xFUt2tz/YamHl6MvtzMsI7amCB/OSTWc+OSLNi8IX7LOP26Qpg9JwV1uArLlb6chG1tex7oN85DXgMvlQBt1Q=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5466.namprd12.prod.outlook.com (2603:10b6:510:d7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14; Wed, 1 Dec
 2021 20:32:15 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::95bf:94a4:e746:d70c]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::95bf:94a4:e746:d70c%6]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 20:32:15 +0000
X-SNPS-Relay: synopsys.com
From:   Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To:     Jonathan Corbet <corbet@lwn.net>
CC:     "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Vineet Gupta <vgupta@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2] docs: Add documentation for ARC processors
Thread-Topic: [PATCH v2] docs: Add documentation for ARC processors
Thread-Index: AQHX17dUyYYH0jdSEE6Xa5YniPzLXKwbKTOAgAMMOK4=
Date:   Wed, 1 Dec 2021 20:32:15 +0000
Message-ID: <PH0PR12MB5401E55A4E8D1D7360C02E68A1689@PH0PR12MB5401.namprd12.prod.outlook.com>
References: <20211112065059.7273-1-abrodkin@synopsys.com>
 <87fsresjx6.fsf@meer.lwn.net>
In-Reply-To: <87fsresjx6.fsf@meer.lwn.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: ea871cac-4543-e287-b8f3-01aa4487fbf7
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f175df6-cb11-4e8e-26b7-08d9b509a96d
x-ms-traffictypediagnostic: PH0PR12MB5466:
x-microsoft-antispam-prvs: <PH0PR12MB54669D5E1510C0C3AFD8D936A1689@PH0PR12MB5466.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jDDfZUYz0iuPwPvmyzynbdoHKXxJUbRjBB/84Af8RRoAtpWYQcFbx09EN1RQy+ncQKCt2uZkNpcdgH3YwAPo3PiUfXt0E7rDNxaMoD6I/E5ENl1BHKMdvsvsUffFbu/UfFZAab4ibnX9Ga6ZZL1NdNoJ2s+NiJdlvMi2/0L/NND+rwTTCaKVySZjOd15iKVusFUd6i7ToyVyqN69sE+dISpwgM9BttAXUV5vL+qsQHbUCIn9rw/alGsCrOW7OO1sr0y7kakjuyPaMLy3NI1oIZM3rGSJIGVe9Xlri8v1H0xFhPNZuy2fHmGQDpTwA3X7B3JEMpw5FdhgsiX6XxXIbrWCymWFx2C9uaZQrUf9uwQU7KdncN6xzSUGFHA6/fSFdSgs7II/X74wHN4IREvw90mon+feSj9BkjHobEhf4rZMC3tk9s0eCPCh0i3gruQPe8FMdJKVXF2IlvllqW/rvMloWLeLLE5b2fzR9gtaBio1JDuNlWwngW8TFS+FSInIqd1nv5VqGV6EZHYmRHSwP/wBOQhHF7bhTBqxZhtXFvykg8hI4qNW9FCtJ8qazMwSXA2B7sJQCsdLytRwV929YsUPX1A3sG4Hx9Y21sJYFygvF48F83NeBCXPB92lHdI6ezBznuuU1/x1PXj6jxPAKcnr/0SdAFk+HSyBgfRzZrV0Bh7aU5n+GJECJ2yU7YAfP7NPay95sCdgwqro9iDbunZRwnT9FfrhxUIISUKNEnoyE9QccLTC0c3ncfVRITc4onZk+fQhbx4xYrGd0X+loHrEAwnyZeFLt/ci3BIZpe8OeNo+OQtoRv4ETunm2pVG1nDKMsCfu9021BnAzEzxPg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5401.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(55016003)(76116006)(33656002)(7696005)(4326008)(6916009)(508600001)(8676002)(8936002)(38100700002)(6506007)(5660300002)(9686003)(66556008)(64756008)(186003)(26005)(54906003)(66446008)(2906002)(16799955002)(66476007)(66946007)(71200400001)(52536014)(316002)(86362001)(38070700005)(83380400001)(91956017)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QY+muklPZ8WFaFx8MYMel2FdcfYmjuAmpFjsu28orvzxiZhmc6uDBAjpYH?=
 =?iso-8859-1?Q?kxbF0ZWqm20Z/UwXm8Otd37QvRDqi3GWJNhO9wcHnixjjl6Xc8EVsqJgcR?=
 =?iso-8859-1?Q?cMd45uO7+Sf1O2xtbdXUxkM9pp9LpE4+yj+aC6zb5xRSgs05KqSZexdYJ0?=
 =?iso-8859-1?Q?gawAj0DV0Bi29ylYewxr0j4HctNyyy77GTWicbPuCLQD903/izT8sQe7G5?=
 =?iso-8859-1?Q?Mni0XVwLWZD47aR9lS+/jGSmm895u++ocuPKTMTpIV2LITiSD2At/4xsBY?=
 =?iso-8859-1?Q?d93BE/4fxvPMlZSHbzIq4jUqIZdjyJ+h2biUnmCI6iGzFTYkAtD1fS6i2B?=
 =?iso-8859-1?Q?KHUCevTcL4lj0dFN4XzV+rI64Bt93Dq+s4e9K76Xfyw6PUdNlOcwZPn98Z?=
 =?iso-8859-1?Q?Ij+HfOWygsKPLsOicv5ZomYtNQRtvizlgUWhWjPxU/C7ALB0Oi7jKriafS?=
 =?iso-8859-1?Q?OehnGtO36IgwIuE+wPx0WIPvKorKH+o3NG2Z4TQXfGhzNhZ0fun4Zn6agB?=
 =?iso-8859-1?Q?3dP6NCZWmrBBqJ+TbCNRi83Py9aWH4L1yFFa2TQI888htVuPkCs7djqf8g?=
 =?iso-8859-1?Q?e3k91roJyoNYV2HkucPmsXTjAOBR5Ck/2GAlz23+FMc41ixhfjESvWjUj1?=
 =?iso-8859-1?Q?QIbRsreLtoSz5Z2dl2fjy185YF7Rwyr7eB/J85HZz1osCBTSwlRdu3G8u+?=
 =?iso-8859-1?Q?3dmuuocEZGXGiwDqQMYg8felIEEbCvDklkLeW2CIswl6ngIHAmusYvr9zp?=
 =?iso-8859-1?Q?wiizo/wUIt+ztLs1n0vKikhd2h+GF7BoDaawBz9Pv9sSUML6SPNa+5iFwP?=
 =?iso-8859-1?Q?ZmQIQchrT/7tZKiZytN5Ialn2i1areJRJ6w5K9iqELL76WfqeJbB6UG6O6?=
 =?iso-8859-1?Q?gg8o0Efu5KcRIXr65yFoABFRdtUPg5BxJTteOmDaNBelkTSCBkLBV4boAT?=
 =?iso-8859-1?Q?fXImjOeUetM/Nb41D74U7iqtuXXeMPfRkgmxoVCUaDWglrzGoj/pyunmMx?=
 =?iso-8859-1?Q?vAof+v7u3+EiA+UoAYD7LG0VrZs6eeVdx2QutWU4Hyzrv5o81oSN2T/13i?=
 =?iso-8859-1?Q?0Gd59WQgHIEswdoFVYcN20kpJPf0sFT5ndNReR22OaS/Jq9re771Cb2Yef?=
 =?iso-8859-1?Q?oOlJhNIAN4WdbRjHSgnaXW2jqbtwufaU3ACQxa8Sau8mwDKssLxJT/WhLf?=
 =?iso-8859-1?Q?7bodsfVexnvlbSuVEYUtDTHC7oOjSwzyKYYq5C09uSLkuSHc1nvyky7/wl?=
 =?iso-8859-1?Q?zmwNQTf93oQlcv4NLuXjWfnNqE/ZfouEDCufs6UlUJ3W03yNwau7VKivPV?=
 =?iso-8859-1?Q?fMzdl4rSBq355IRJ+C/2ThtlwMeXhrkmZChbCVXK5cmknSk2i0BTSPfo7h?=
 =?iso-8859-1?Q?swxmIAifUU674FhPFBOqtIpRtxYoVn02TY+r77C0x+24Cgj+H/qLE7lydN?=
 =?iso-8859-1?Q?A3BjyDl3FLbiStSE7IA0ADFaPsnA13B3KzaNo+X4quFedpcEJ3X/F0dVvC?=
 =?iso-8859-1?Q?BRSw68NrOZvtEA/6Yei7JM/5FJCIm0U1N9Ei4u1+/rOYAyxfiW06bgnEvi?=
 =?iso-8859-1?Q?ffD1I17eipVNeaKGIf5FRE6kX6wZ8uep4Ub/aiYuUG3bMNVk5pFf0eWuXx?=
 =?iso-8859-1?Q?CEFwbmcJ6Zknyp12zf7q8HRB7YPe9PIU0ocjbL9yEmZGYR7tgF7bwMqQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f175df6-cb11-4e8e-26b7-08d9b509a96d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 20:32:15.0725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBeYz9Wn3Tm45kuJxyofGER5rZpEjaQzDoHwqK9P/RqFSrhMZ6bi2+Y7A5vZtXWnEm18pcSqLaE/3PSpCe63zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5466
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,=0A=
 =0A=
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>=0A=
> > Cc: Randy Dunlap <rdunlap@infradead.org>=0A=
> > Cc: Vineet Gupta <vgupta@kernel.org>=0A=
> =0A=
> I've applied this set, but I have a couple of quibbles that it would be=
=0A=
> nice to see addressed...=0A=
=0A=
Thanks for taking care of that!=0A=
=0A=
> > +3. `<https://www.synopsys.com/designware-ip/processor-solutions.html>`=
_ -=0A=
> > +Official Synopsys ARC Processors website location, with access to some=
 IP=0A=
> > +documentation (Programmer's Reference Manuals, AKA "PRM's", see=0A=
> > +`<https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manu=
al-ARC-HS.pdf>`_)=0A=
> =0A=
> This manual requires registration (with a fair amount of information=0A=
> required) to get.  That should at least be mentioned if we can't find a=
=0A=
> less obnoxious version out there.=0A=
=0A=
Well, I'm afraid that's the best we may get as of now. I wish is was availa=
ble=0A=
with no registration whatsoever, but at least it could be easily had now by=
=0A=
wide audience.=0A=
=0A=
Anyways, I'm wondering what kind of mention do you think is appropriate her=
e?=0A=
Somehting like: "note, registration is required"?=0A=
 =0A=
> > +Building the Linux kernel for ARC processors=0A=
> > +############################################=0A=
> > +=0A=
> > +The process of kernel building for ARC processors is the same as for a=
ny other=0A=
> > +architecture and could be done in 2 ways:=0A=
> > +=0A=
> > +1. cross-compilation: process of compiling for ARC targets on a develo=
pment=0A=
> > +host with a different processor architecture (generally x86_64/amd64).=
=0A=
> > +=0A=
> > +2. native compilation: process of compiling for ARC on a ARC platform=
=0A=
> > +(hardware board or a simulator like QEMU) with complete development en=
vironment=0A=
> > +(GNU toolchain, dtc, make etc) installed on the platform.=0A=
> =0A=
> These enumerated lists would render a lot more pleasantly if you=0A=
> actually formatted them as RST enumerated lists - with lines after the=0A=
> first indented.=0A=
=0A=
Indeed, I'm much more used to Markdown and there it works ;)=0A=
So should I send a re-spin with fixed version?=0A=
=0A=
 =0A=
> > +In both cases, up-to-date GNU toolchain for ARC for the host is needed=
.=0A=
> > +Synopsys offers prebuilt toolchain releases which can be used for this=
 purpose,=0A=
> > +available from:=0A=
> > +=0A=
> > +1. Synopsys GNU toolchain releases:=0A=
> > +`<https://urldefense.com/v3/__https://github.com/foss-for-synopsys-dwc=
-arc-processors/toolchain/releases__;!!A4F2R9G_pg!N40JBI0hlr_f_ZX-pTGEO-vBv=
xNaA6NF4WYKA3yamILtuUOhgiEsFqRLfdx9VfetWmy7or8$ >`_=0A=
> > +2. Linux kernel compilers collection:=0A=
> > +`<https://urldefense.com/v3/__https://mirrors.edge.kernel.org/pub/tool=
s/crosstool/__;!!A4F2R9G_pg!N40JBI0hlr_f_ZX-pTGEO-vBvxNaA6NF4WYKA3yamILtuUO=
hgiEsFqRLfdx9VfetayTOVRo$ >`_=0A=
> > +3. Bootlin's toolchain collection: `<https://urldefense.com/v3/__https=
://toolchains.bootlin.com/__;!!A4F2R9G_pg!N40JBI0hlr_f_ZX-pTGEO-vBvxNaA6NF4=
WYKA3yamILtuUOhgiEsFqRLfdx9Vfet7I-6RoI$ >`_=0A=
> =0A=
> These, in particular, render in a pretty ugly way.=0A=
=0A=
Right, here it gets even worse due to missing newlines. Again, fixed by:=0A=
-------------------------->8----------------------------=0A=
diff --git a/Documentation/arc/arc.rst b/Documentation/arc/arc.rst=0A=
index 249d03c6be8e..4dbd107f02e6 100644=0A=
--- a/Documentation/arc/arc.rst=0A=
+++ b/Documentation/arc/arc.rst=0A=
@@ -10,23 +10,23 @@ Below are some resources where more information can be =
found on=0A=
 ARC processors and relevant open source projects.=0A=
=0A=
 1. `<https://embarc.org/>`_ - Community portal for open source on ARC.=0A=
-Good place to start to find relevant FOSS projects, toolchain releases,=0A=
-news items and more.=0A=
+   Good place to start to find relevant FOSS projects, toolchain releases,=
=0A=
+   news items and more.=0A=
=0A=
 2. `<https://github.com/foss-for-synopsys-dwc-arc-processors>`_ -=0A=
-Home for all development activities regarding open source projects for=0A=
-ARC processors. Some of the projects are forks of various upstream project=
s,=0A=
-where "work in progress" is hosted prior to submission to upstream project=
s.=0A=
-Other projects are developed by Synopsys and made available to community=
=0A=
-as open source for use on ARC Processors.=0A=
+   Home for all development activities regarding open source projects for=
=0A=
+   ARC processors. Some of the projects are forks of various upstream proj=
ects,=0A=
+   where "work in progress" is hosted prior to submission to upstream proj=
ects.=0A=
+   Other projects are developed by Synopsys and made available to communit=
y=0A=
+   as open source for use on ARC Processors.=0A=
=0A=
 3. `<https://www.synopsys.com/designware-ip/processor-solutions.html>`_ -=
=0A=
-Official Synopsys ARC Processors website location, with access to some IP=
=0A=
-documentation (Programmer's Reference Manuals, AKA "PRM's", see=0A=
-`<https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-A=
RC-HS.pdf>`_)=0A=
-and commercial tools (Free nSIM,=0A=
-`<https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi>`_ and=0A=
-MetaWare Light Edition, `<https://www.synopsys.com/cgi-bin/arcmwtk_lite/re=
g1.cgi>`_)=0A=
+   Official Synopsys ARC Processors website location, with access to some =
IP=0A=
+   documentation (Programmer's Reference Manuals, AKA "PRM's", see=0A=
+   `<https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manua=
l-ARC-HS.pdf>`_)=0A=
+   and commercial tools (Free nSIM,=0A=
+   `<https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi>`_ and=0A=
+   MetaWare Light Edition, `<https://www.synopsys.com/cgi-bin/arcmwtk_lite=
/reg1.cgi>`_)=0A=
=0A=
 Important note on ARC processors configurability=0A=
 ################################################=0A=
@@ -53,20 +53,22 @@ The process of kernel building for ARC processors is th=
e same as for any other=0A=
 architecture and could be done in 2 ways:=0A=
=0A=
 1. cross-compilation: process of compiling for ARC targets on a developmen=
t=0A=
-host with a different processor architecture (generally x86_64/amd64).=0A=
+   host with a different processor architecture (generally x86_64/amd64).=
=0A=
=0A=
 2. native compilation: process of compiling for ARC on a ARC platform=0A=
-(hardware board or a simulator like QEMU) with complete development enviro=
nment=0A=
-(GNU toolchain, dtc, make etc) installed on the platform.=0A=
+   (hardware board or a simulator like QEMU) with complete development env=
ironment=0A=
+   (GNU toolchain, dtc, make etc) installed on the platform.=0A=
=0A=
 In both cases, up-to-date GNU toolchain for ARC for the host is needed.=0A=
 Synopsys offers prebuilt toolchain releases which can be used for this pur=
pose,=0A=
 available from:=0A=
=0A=
 1. Synopsys GNU toolchain releases:=0A=
-`<https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releas=
es>`_=0A=
+   `<https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/rel=
eases>`_=0A=
+=0A=
 2. Linux kernel compilers collection:=0A=
-`<https://mirrors.edge.kernel.org/pub/tools/crosstool/>`_=0A=
+   `<https://mirrors.edge.kernel.org/pub/tools/crosstool/>`_=0A=
+=0A=
 3. Bootlin's toolchain collection: `<https://toolchains.bootlin.com/>`_=0A=
=0A=
 Once the toolchain is installed in the system, make sure its "bin" folder=
=0A=
-------------------------->8----------------------------=0A=
=0A=
-Alexey=
