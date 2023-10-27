Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649C51CF89
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="XQJT4G4d"
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBCB128;
	Fri, 27 Oct 2023 06:01:13 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39RAr4gA029332;
	Fri, 27 Oct 2023 09:00:58 -0400
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3tyx01nte9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Oct 2023 09:00:57 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIhfjo3KPuiMGFGp8+XjT+U4UnyMeLg0KW1x0Cq77hzM7M5gijO4p03tDz8uPozyPH58D9L1rtU4RpP1iCaUz5qJQ/wzmaqzsjQM7RzuHAOycP18fwW+edLw+Y55bdJ+oHpV0JenlIFlojRZCQFGNW5Ua9TtktMSOAtr51RBuulh0KjzFLU5Z9jVF3vS8bni2jAAY6qZ1iAYATfV3BHv9rBeIF0dqUK+8PF1YvzWF5JRMc3GTDuXDsblpVAC2ViqGMcYbxN0oiWluFda/clqdt5qstLT+V/nif82cTAphW8guACBevujyLXTpH6+skD508dJeK5b/hyQca0L1ImPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=557A2sDgWB4s91+crRYb4/12JE1JExM2H8cWJj8TfN8=;
 b=HPcmqg60b083SjPEOicvG3T5H1o05o8FllUBPCZClXGmVAhfzX4VHzEqTOkm4I7JgpZZoR16z3wKs80+zruKy3SerRooAqjbBbRlcQY0vutrxXnKBCHiYJSJFPxRR5kfmsMqUN+NyYd2o66el9mrFtVtwGlVpKn+SKPdEr9Cm57QA0ZCjqdn0Dj0bQA7eF+FILFNPsE8qLZWnPiljVG2Y8+xRCMQgQLYHtM0jKmPbFMC53teAfQfNpxs3QKZ+wjK//C2c6i0jIj/Hni154AY5tG7J/rWn7ajhRDfyX2a0N2slH4fipiK/tD3O+nnmXoRQUMolkfOMdDzEqERCnhgwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=557A2sDgWB4s91+crRYb4/12JE1JExM2H8cWJj8TfN8=;
 b=XQJT4G4dEifopIsyF9bH7X+4z+m7alKEMuO+eFWD9X5zx6EMOR65UhlLlWlNpFMbgFuXpiHQySPI+qazVO3fJUOllpdjHBgZmhwjQ5Z1UPv4L1x2fFJZcjVVpQG2fLFRwkydz03L05ALQw+VAl2FLeP3jGRqJZ/vqntVLjJw33E=
Received: from PH0PR03MB6771.namprd03.prod.outlook.com (2603:10b6:510:122::17)
 by BY1PR03MB7310.namprd03.prod.outlook.com (2603:10b6:a03:52c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Fri, 27 Oct
 2023 13:00:55 +0000
Received: from PH0PR03MB6771.namprd03.prod.outlook.com
 ([fe80::d18d:cbcc:2b22:9b25]) by PH0PR03MB6771.namprd03.prod.outlook.com
 ([fe80::d18d:cbcc:2b22:9b25%3]) with mapi id 15.20.6954.011; Fri, 27 Oct 2023
 13:00:53 +0000
From: "Matyas, Daniel" <Daniel.Matyas@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: no To-header on input <;>, Jean Delvare <jdelvare@suse.com>,
        Jonathan
 Corbet <corbet@lwn.net>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 2/4] hwmon: max31827: Add support for max31828 and
 max31829
Thread-Topic: [PATCH v5 2/4] hwmon: max31827: Add support for max31828 and
 max31829
Thread-Index: AQHaCBrux3jCd9w9Ok6JeCc2kSWWE7BdFUuAgABLXpA=
Date: Fri, 27 Oct 2023 13:00:53 +0000
Message-ID: 
 <PH0PR03MB67712B3C063B794442F6D58A89DCA@PH0PR03MB6771.namprd03.prod.outlook.com>
References: <20231026144405.546822-1-daniel.matyas@analog.com>
 <20231026144405.546822-2-daniel.matyas@analog.com>
 <fe99431e-3245-484c-bf26-928048500ec6@roeck-us.net>
In-Reply-To: <fe99431e-3245-484c-bf26-928048500ec6@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcZG1hdHlhc1xh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLWQ5NjEzOGY3LTc0YzgtMTFlZS1iNzQ4LTE4MWRl?=
 =?us-ascii?Q?YWFmMTM0MVxhbWUtdGVzdFxkOTYxMzhmOS03NGM4LTExZWUtYjc0OC0xODFk?=
 =?us-ascii?Q?ZWFhZjEzNDFib2R5LnR4dCIgc3o9IjEzOTkwIiB0PSIxMzM0Mjg4NTI0OTQ4?=
 =?us-ascii?Q?OTU1NzYiIGg9IlB0REhFZnYyT3BDblNlWDhXQ0NYdXRZK291bz0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?RFlDYitiMVFqYUFiZFZuSnBoVUMxRXQxV2NtbUZRTFVRREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBbEdUR1ZnQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
 =?us-ascii?Q?UUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQmxBR01BZEFCekFG?=
 =?us-ascii?Q?OEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdrQWRnQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRR?=
 =?us-ascii?Q?QnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURF?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVlRQmtBR2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dC?=
 =?us-ascii?Q?dkFHb0FaUUJqQUhRQWN3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21l?=
 =?us-ascii?Q?dGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6771:EE_|BY1PR03MB7310:EE_
x-ms-office365-filtering-correlation-id: 6f1940b8-39ab-421d-8fa7-08dbd6ecc089
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GWRAeDWqRuJgoms6zMiLMXE+6k8LX9c0As/TkJmEszWWvpBfN6Ixo2GnRJYQTSi9HLJsdj/AcJWCQhaitZzlbkAsVdW8GWujcw70MS8RJg8FoA8As7+boB3YxbBJJ3K+CCllYOpIhdwksfrUB8eUxvYEhGmb3X0tHDAK1Heza2WZHteijz7CjVt/JtlgCSRl1+j/3TgKFZy0m8lnms80clZMwGO0cw/IuN/feOcXlS5eaiphfBmVBuaXkiPlL9mBGkJ9PPnNXyagms9B9Pal9P8EA7gKTAs7QhEXDBp1mQnhFD7hl5L5PiclzuKUjQRqBD3z08qUSJ3jNeNSqbb0bOR+UG3HfQUnfNeUEqHbEL54aCSriFophZMlcFmPKzBFUjzqGR0zOCfG6SaksuVgKXyQSSHwyy4vKH5cEhMm96ipZ09RqH2DUnxX2k8n9c2aVOOP/hzJZDByt8tJq/g0wcp1Io8r7vt1EEGKukzhIu6Ce/azzaU23EFf5azpQobRVi8qG5nG81Fw6vL0fPPIBU8lGvRMKTLObtH2R4vgE9Fvasx6b/bjd8C8y1YqNVc0Bs6vVYQS03do+aBFvba6FrdL1YcB2pKJoGqtLFPI7al0lRGFiFQLdsR7Ogfaondrhh1K7ddAs4lHdBOoHX4AnbtfwsatGmaIptFE35rfHcZju/RYBpsvam5J42YcHBMo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6771.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(451199024)(1800799009)(8936002)(8676002)(2906002)(41300700001)(4326008)(52536014)(38070700009)(5660300002)(7696005)(26005)(122000001)(53546011)(71200400001)(6506007)(38100700002)(9686003)(33656002)(55016003)(66476007)(64756008)(66446008)(66946007)(6916009)(316002)(76116006)(86362001)(478600001)(83380400001)(66556008)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?faOcduzAD/T+Nxe28kEABSxsefwCKBSnyPwQaaR4jfOozmDanSDgcg5rJb/x?=
 =?us-ascii?Q?9h6AMGtQK/75r8wzE06wGnWhDKIFnTZ3I9I+P8Vujk3vAgzON/bwe0y0W8Xd?=
 =?us-ascii?Q?Wcm/Ziqa95+QP92FH9+6qCLQOHNomaoPfAMvg4LinP81famTQwc56kuJwBHg?=
 =?us-ascii?Q?e2CtKNvr1ILjXd2YP5YYBk1+W7FtUPPF+iFRksF8f+VAxILcfM5M2360b9I9?=
 =?us-ascii?Q?p1y3HWX2qb/TqBhgjLsvZhSOa4XzdPJwNjbsTb6KzI6x1ajMyblCu+/x8SPe?=
 =?us-ascii?Q?X33aLmwE87pYnHfetYrtVbU+8ZOK+Y2RHiUUXIZl8BkVcOPhzC3dXcgv3c9b?=
 =?us-ascii?Q?qLp721ZSF3pcOS4bYyonnFKe+gkA69b8B+roPM3V+33aMTFSpbj8YpZSHXOn?=
 =?us-ascii?Q?mcTb5cKRFQs3q6JS3RUr1ABEkJMDPDp4ZHAzAxNQGrTguInR6CkVkXSMbot4?=
 =?us-ascii?Q?43YRD8I9WcWNkoKCTZfZPzS8O+e6mO23hNeugivTFc3NAZ1vU9m6vcLjl41A?=
 =?us-ascii?Q?NlP+1l8bbeQPLKsGbh8C65b0EUiPPY1MfXaYdLi+Xit0Hd3BLLQGDZ21t0Fo?=
 =?us-ascii?Q?ueDGY3mUDmZTFz5dBLvZ7tD2OY2whjFz/vlK+5dj8DqsPH7n2FZqIYID9P/G?=
 =?us-ascii?Q?oDzlc9yJ3NNF2z7E9AnZ2EaAxhGi99BBP5IR/G9vUx0Bw5jpWUMtyzZLsTR0?=
 =?us-ascii?Q?+pws6QcK/XbBwQDfk9WvEUgDwUZUVVMma2/iMUsvMUkdu+FKEPsuBh+P01Yv?=
 =?us-ascii?Q?zv+qs653AWJ7UQnnAb9hLtoLRsTGEHtFSJ0CQD/tJAUbNySE11oGFxw6kkX/?=
 =?us-ascii?Q?UWX4QTCr7do7UjWeN7KI75n+Ut5x9PJJ/Lu4WHd4jfqc13/XvyGYKykm+n5g?=
 =?us-ascii?Q?zaq39BuXRMHj/DZlv1rh6rNvKiGZEPCim7h82eiHAEaSHcAFFkaqvPUBPUhd?=
 =?us-ascii?Q?OMMh+6PImrsiG4nw20ZFrdzWWIgnPvRlidlARdasS6mncQzaQ5XVAAycHhE6?=
 =?us-ascii?Q?Vc5+WbEWRQ6/pWbv2kfsrfsudsXmKoe9+uDmfMA1p/pYrUtOh6k6MMcxtxyX?=
 =?us-ascii?Q?MlsEVVvNSF/5fu/5F81Z5ibev21cYP+n5JuGUj51IuSKVibqttT77Zajz+W8?=
 =?us-ascii?Q?MSxKLe/i2Sl61gMxMd2N/RO7tUUPZAMq5R/sL//W0irC6BVT5lEgQ+xQXtWA?=
 =?us-ascii?Q?SMYJ5FjEb/rdlytUCv+ogvlyVq9JhQj4TxBDv1TVmQcy7nlmk1nuf1TaVwjV?=
 =?us-ascii?Q?jYtNg8dddT3riFLJcNF37i0E6nDYXm/YgK/XesvnPVrX2quIKyJYPYSqgQdL?=
 =?us-ascii?Q?M2NlTXDnoLUk5DxrKfliKH28HrMDg4TM6oTM2Vkfu2NMy/Wq1cZUGmLdvV6F?=
 =?us-ascii?Q?s1ML0r6keLNdP/vJR0vmAaXIrqCYhzdQ7mOBcHXsFU1nPHnhqRr8aaCaBYLX?=
 =?us-ascii?Q?G+FfY6doZgG4UusngyIa7YMbkO0/mtU3RanQ1Z5zajMo74SyNwWi1m4558Io?=
 =?us-ascii?Q?G8wGs+KIvWrYczHxYWd9PNORrdHloBe3KJa0QYO3DLCPWNtDnVwiTDBXqbrz?=
 =?us-ascii?Q?l60fGaXt3RmShFOvSup6x2qMHfuSM/1FpkHhyQ6U?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6771.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1940b8-39ab-421d-8fa7-08dbd6ecc089
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 13:00:53.3678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yjOq+3zvuRB0HJpE0AYAetKK5CWxWVrfMGdnzLtVYTbrp3qZFz+B5WoXBKOsBzFgofX/pK84KsOLv1lfxswJUZ/3AkU7ssCXEEWKWFfcEd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7310
X-Proofpoint-ORIG-GUID: 6L84kYDsME9anB6-Pd8sOeleRcIPxXx2
X-Proofpoint-GUID: 6L84kYDsME9anB6-Pd8sOeleRcIPxXx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_10,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310270111



> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Friday, October 27, 2023 8:02 AM
> To: Matyas, Daniel <Daniel.Matyas@analog.com>
> Cc: no To-header on input <;>; Jean Delvare <jdelvare@suse.com>;
> Jonathan Corbet <corbet@lwn.net>; linux-hwmon@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v5 2/4] hwmon: max31827: Add support for
> max31828 and max31829
>=20
> [External]
>=20
> On Thu, Oct 26, 2023 at 05:44:02PM +0300, Daniel Matyas wrote:
> > When adi,flt-q and/or adi,alrm-pol are not mentioned, the default
> > configuration is loaded.
> >
> That isn't really a complete patch description.
> It should include (even if repeated) that support for additional chips is
> added.
>=20
> > Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
> > ---
> >
> > v4 -> v5: Passed i2c_client to init_client(), because I needed it to
> > retrieve device id.
> > Used a simple if to load default configuration. No more switch.
> >
> > v3 -> v4: No change.
> >
> > v3: Added patch.
> >
> >  drivers/hwmon/max31827.c | 51
> > +++++++++++++++++++++++++++++++---------
> >  1 file changed, 40 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
> index
> > 7976d668ffd4..446232fa1710 100644
> > --- a/drivers/hwmon/max31827.c
> > +++ b/drivers/hwmon/max31827.c
> > @@ -39,10 +39,15 @@
> >
> >  #define MAX31827_12_BIT_CNV_TIME	140
> >
> > +#define MAX31827_ALRM_POL_HIGH	0x1
> > +#define MAX31827_FLT_Q_4	0x2
> > +
> >  #define MAX31827_16_BIT_TO_M_DGR(x)	(sign_extend32(x, 15) *
> 1000 / 16)
> >  #define MAX31827_M_DGR_TO_16_BIT(x)	(((x) << 4) / 1000)
> >  #define MAX31827_DEVICE_ENABLE(x)	((x) ? 0xA : 0x0)
> >
> > +enum chips { max31827, max31828, max31829 };
> > +
> >  enum max31827_cnv {
> >  	MAX31827_CNV_1_DIV_64_HZ =3D 1,
> >  	MAX31827_CNV_1_DIV_32_HZ,
> > @@ -373,12 +378,22 @@ static int max31827_write(struct device *dev,
> enum hwmon_sensor_types type,
> >  	return -EOPNOTSUPP;
> >  }
> >
> > +static const struct i2c_device_id max31827_i2c_ids[] =3D {
> > +	{ "max31827", max31827 },
> > +	{ "max31828", max31828 },
> > +	{ "max31829", max31829 },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, max31827_i2c_ids);
> > +
> >  static int max31827_init_client(struct max31827_state *st,
> > -				struct device *dev)
> > +				struct i2c_client *client)
> >  {
> > +	struct device *dev =3D &client->dev;
> >  	struct fwnode_handle *fwnode;
> >  	unsigned int res =3D 0;
> >  	u32 data, lsb_idx;
> > +	enum chips type;
> >  	bool prop;
> >  	int ret;
> >
> > @@ -395,13 +410,20 @@ static int max31827_init_client(struct
> max31827_state *st,
> >  	prop =3D fwnode_property_read_bool(fwnode, "adi,timeout-
> enable");
> >  	res |=3D
> FIELD_PREP(MAX31827_CONFIGURATION_TIMEOUT_MASK, !prop);
> >
> > +	if (dev->of_node)
> > +		type =3D (enum chips)of_device_get_match_data(dev);
> > +	else
> > +		type =3D i2c_match_id(max31827_i2c_ids, client)-
> >driver_data;
> > +
>=20
> This should be something like
>=20
> 	type =3D (enum chips)(uintptr_t)device_get_match_data(dev);
>=20
> though that requires that the enum values start with 1. This avoids havin=
g
> to pass client to the function and is more generic.
>=20
> >  	if (fwnode_property_present(fwnode, "adi,alarm-pol")) {
> >  		ret =3D fwnode_property_read_u32(fwnode, "adi,alarm-
> pol", &data);
> >  		if (ret)
> >  			return ret;
> >
> >  		res |=3D
> FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK, !!data);
> > -	}
> > +	} else if (type =3D=3D max31829)
>=20
> Not sure why checkpatch ignores this (maybe because of 'else if'), but th=
e
> else path should also be in {}.
>=20
> But why is this only for max31829 ? I mean, sure, the default for that ch=
ip
> is different, but that doesn't mean the other chips have that bit set. Th=
ere
> is no guarantee that the chip is in its default state when the driver is
> loaded.
>=20
> > +		res |=3D
> FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK,
> > +				  MAX31827_ALRM_POL_HIGH);
> >
> >  	if (fwnode_property_present(fwnode, "adi,fault-q")) {
> >  		ret =3D fwnode_property_read_u32(fwnode, "adi,fault-q",
> &data); @@
> > -418,7 +440,9 @@ static int max31827_init_client(struct
> max31827_state *st,
> >  		}
> >
> >  		res |=3D
> FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK, lsb_idx);
> > -	}
> > +	} else if ((type =3D=3D max31828) || (type =3D=3D max31829))
>=20
> I _really_ dislike the notion of excessive ( ). Also, {} for the else bra=
nch.
>=20
> I also don't understand why that would be chip specific. I don't see
> anything along that line in the datasheet.
>=20
> Ah, wait ... I guess that is supposed to reflect the chip default.
> I don't see why the chip default makes a difference - a well defined defa=
ult
> must be set either way. Again, there is no guarantee that the chip is in =
its
> default state when the driver is loaded.

The well defined default was set in v4, but I deleted it, because the defau=
lt value in hex for max31827 and max31828 alarm polarity, and max31827 faul=
t queue is 0x0. I had 2 #defines for these values, but you said:
" Since MAX31827_ALRM_POL_LOW is 0, this code doesn't really do anything an=
d just pollutes the code. "

So, I thought I should remove it altogether, since res is set to 0 in the b=
eginning and the default value of these chips (i.e. 0) is implicitly set.

>=20
> Also, why are the default values added in this patch and not in the
> previous patch ?
>

In v4 these default values were set in the previous patch.
=20
> > +		res |=3D
> FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK,
> > +				  MAX31827_FLT_Q_4);
> >
> >  	return regmap_write(st->regmap,
> MAX31827_CONFIGURATION_REG, res);  }
> > @@ -464,7 +488,7 @@ static int max31827_probe(struct i2c_client
> *client)
> >  		return dev_err_probe(dev, PTR_ERR(st->regmap),
> >  				     "Failed to allocate regmap.\n");
> >
> > -	err =3D max31827_init_client(st, dev);
> > +	err =3D max31827_init_client(st, client);
> >  	if (err)
> >  		return err;
> >
> > @@ -475,14 +499,19 @@ static int max31827_probe(struct i2c_client
> *client)
> >  	return PTR_ERR_OR_ZERO(hwmon_dev);
> >  }
> >
> > -static const struct i2c_device_id max31827_i2c_ids[] =3D {
> > -	{ "max31827", 0 },
> > -	{ }
> > -};
> > -MODULE_DEVICE_TABLE(i2c, max31827_i2c_ids);
> > -
> >  static const struct of_device_id max31827_of_match[] =3D {
> > -	{ .compatible =3D "adi,max31827" },
> > +	{
> > +		.compatible =3D "adi,max31827",
> > +		.data =3D (void *)max31827
> > +	},
> > +	{
> > +		.compatible =3D "adi,max31828",
> > +		.data =3D (void *)max31828
> > +	},
> > +	{
> > +		.compatible =3D "adi,max31829",
> > +		.data =3D (void *)max31829
> > +	},
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, max31827_of_match);
