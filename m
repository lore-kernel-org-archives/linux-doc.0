Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C8836E477;
	Thu, 30 Jul 2026 16:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429611; cv=fail; b=KdBjjJ4VOfnjnyGrMgRpMGqNbZLe95qzvKVWZ6uHRZPT7Gjw2zEwLpGbPqdMT8MCo6ApoLN8cKMYMXwKzyx4Fru7k4kkybfTjJCyPN4g2iffkOdLRYAxlqwzd6+/k+3wtkGnupDEOqvvLxiH5PnWr/fYv5jl1pqyfjBzireviOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429611; c=relaxed/simple;
	bh=38b0yhMOlXqmk4sdzyo2rRosgTzhPlbVqedgVmOKSPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QSPdalX/ToXQxFYscuBnFV7T6NphbCQIm8HksjNDApxbbWHJkuVy3/wHw/xAnq4EUF6/4wwBQAmNryzUwfh+QnJYQmm9MhPQUJZDbIgC3k2nlYoJh5OswE/XtkR2ZxxelNz7+Qn0zfq8TyGNk4b1fGnG4uWG3eIUjFqZYk4K9JY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=qRwwbToP; arc=fail smtp.client-ip=52.101.56.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="qRwwbToP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJLdVeIDuJf+EIl1rxlg+eGJg7TRLsGNKqc2wrsTuUWeO4ODbYubXwjOnbCRiA6RqC9MpCaIpnkfMeoJb9X6hCXnRGXXBXS4/NBncvmBXlta84mAGS/1d7LrDAlMieQ/Cw9RSENrIu31KtHxQat1SLHFr0TmK+WNZFruH2RAqxT7aCoywGge30rwGEnW50dWVbQ7TY88Xb8bPiftIervjNACrPYr8VR29x9O0/xR8SqJ7G19Uci+ZWuvUBXW01UGXH2QeV1tWzWRMHaadQIVV/OAnfbSk6kZuyLIKiq4iSmo6nJvFoMuxheBJkIheZCEKdhKcFye3pPk3uRbqrmSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIaROSXSi1L+BjO8fyjOdDDYyl+x48VppmYJQdZMV+E=;
 b=ZfNOcBxdYPAVUoPbxGODhNBZ8hxJTzgE+dpQvzKHc7ap8eke2vMG3BD2qizDuwFzOeeuvq/i0DQqGb8I+D29V6d5Q2uBQBdfqshCb/gzM5sUQpShlf+Bpgwhki4sI4ANk/JmjR/IhtoneWtdsQrya8Jzl3Oblu0luz7vWCadbcqD4NZI5PWKW3nXCiy26W2ZFZ5MuDcQievfe/6Qreq0nT4fLMPPS6wfFS9LRW2I17HG3LuBqdWwlq9sDMu26a4FgHOWbAidIPmCpOF0TRzSpsjLaaIhEKrO97KCu97IlATQjIntbSuc0upVXo4MR1fpTHHRMwJk0THguC0WF/rJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIaROSXSi1L+BjO8fyjOdDDYyl+x48VppmYJQdZMV+E=;
 b=qRwwbToPXYxPfCPJaJv+gbg3mSLIwzaMDA9G3wtdAWO8TAfmR5IDJGctJ3u1EoflQ7tlO9xeYXGQmht+IUfDhTn0DU4lRqIQtKiBWEWHnRUmJtUun2z47U9r84gtTK5DKqWOFWEBOM8sKuxUvnIVJnN4AK6PChT5d/isZD5+8MrqyQweJlHdvW828Tk5jkUue+ow1hISzum7NhCeP9vuksbGTOaO2L0w7agiLGxHPz9QmiXeDcwx+tVxGtXj8KS1YlqvcQDSf6wucdX5x4E8BiWmV2jjK9FNPb4AJzIP1FlVmtYfjPzcQcR3blZYdYJOnh11V2UYuJy/KbcDc9VMAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6560.namprd03.prod.outlook.com (2603:10b6:510:b2::12)
 by PH7PR03MB7267.namprd03.prod.outlook.com (2603:10b6:510:24e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 16:40:03 +0000
Received: from PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b]) by PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 16:40:03 +0000
From: hang.suan.wang@altera.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-doc@vger.kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v3 2/3] firmware: stratix10-svc: add FCS crypto-service commands for Agilex 5
Date: Thu, 30 Jul 2026 09:39:58 -0700
Message-ID: <dc7c5fb6afa1ec8583d92c61be9c21dc8537f626.1785413906.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1785413906.git.hang.suan.wang@altera.com>
References: <cover.1785413906.git.hang.suan.wang@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::11) To PH0PR03MB6560.namprd03.prod.outlook.com
 (2603:10b6:510:b2::12)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6560:EE_|PH7PR03MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: e62ffd64-e91f-42b7-6a3d-08deee5934a2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|56012099006|11063799006|10067099003|6133799003|55112099003|18002099003|22082099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
	+yo+DwjIRqpuH6xmcOHMXVaAsDXLNyh+ZnYG0lSLpCQ4PTH7k1vtAIGqePuuvVG9FvdTwVYeiewETqGRr7fC/cd7cUmUd0hZXT67XCkO12VeK1UGrSPSBlxYFEPZRYQq5noNHyT3JF52y4k1nLTdAURzn0RBO8SezImPXm9ak7EGQlbyc8HcMRcmM4K9fyvH/ewKiaLId96gwpNA3tKQ1NqYigM8Db8UBbhPTNXdGz/TLcKnwK5O9+fYVD9LXkc6zB6O0bHk2apZRn71D6An9U0we2oH9B34f3fIX7mVjR1S6zvVpNqZ7ujdHSuALsHsOqCj/q23VmQkqONEDKPhYICGt4UIgqWibJHrBHZBuPlYb7/8W112TCHVoG1CYXCbX51BpuYY3ZDsXgVXCvsmgSeF71gttnXUxHVkm7vxjkjS4ESkr499RWPw8+Q3uxmi7ouhEDwBOMjZICdWga4+YjgbDC6QtVxV3FtK4Wm8aCcvWOhhZglqsNmDGHt6a39h0VWmQncWb6k2kHcIa7goDaM7zOx6s3k458CyhbMUsiEnhN54heMPOe65ykXZWt09UbHbnDlfjKkfxtdpZ4WzBGkpIAe5kRjms+lcaJ3kDIOY4YzyHUS95Tf3TYaHBVvGykKWVcXLOJz6seyrqPwTziYNGcL51uwEMaNfjRiWcawdEx1h8WL1qrO5cwcXfplyp0orXk7caDkSxhZj2zfPuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6560.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(56012099006)(11063799006)(10067099003)(6133799003)(55112099003)(18002099003)(22082099003)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3tMeIN3EXJIqOztmTKbLPrjEAHf1jhVKnPtSA4FfLSBpLj0/HHxTQdaeGFDu?=
 =?us-ascii?Q?ePUcSSGlmBz/vPEWU+awHvfSoYEaTmzCCGQs37qrfwSoQliTy9zEQGM4LxS0?=
 =?us-ascii?Q?UKMUkpN2UiZw5rGmEdrSmNCrxZkSlr/OTskaCwaKMpQB1QAx0hTc5ZdU2VAC?=
 =?us-ascii?Q?ri6Ahd9qBf7VBRwEb3c1JxbhxCzm7dI1M7wyNVExIGw1f1EMAPJlScHDXs29?=
 =?us-ascii?Q?VJOvixup7gePjRUjw/CKR1ooGZeJ6kaez/XC2nUojKa5g4DsmvLzOiCYx1rc?=
 =?us-ascii?Q?6FwBWk+JvioJw5RJOtxRIr1q6lAv97fTIgPgncbLYCi9P4H9ShDf0HSFvUSt?=
 =?us-ascii?Q?/CENlL2KLWC92ljzzptqcdtAITYpo2vExGsiDOtImXUijy5keE0uk506+tB5?=
 =?us-ascii?Q?NadIkutqPQR8UfNI9TnVApF/MKPhDR7Y8cfGt+sfzEtilbsaMGn+PM0ZMNxW?=
 =?us-ascii?Q?zLbtqSrRmBAPuB0HUhfR/fLQ1Yx+V3VPQXIDalHpCHzLE5SCTwQxWMkdKXKZ?=
 =?us-ascii?Q?piUQFxZYWabHOTWvCv+jnoktTg3rTzN2fyBf2hSbWnVb2e6Wold75FAJr+JY?=
 =?us-ascii?Q?hcEVp53qIZkPU/2DiDarSyvi3mMvW305qiOfTArD8PaBy01bOScFs1HffxJ+?=
 =?us-ascii?Q?NbvgPGeqpm+9UllY+bxP7ch4BWTgW7WNRtfx4A7mEXyrUwkZCRqRbDTCe2/x?=
 =?us-ascii?Q?msyy8Yb7wSVnErfOwiFPLpezxPLclsswNS4e2OB3qjVs5vO3HrBtbLf88aGR?=
 =?us-ascii?Q?hRHiNL4peyxppJndAL3qFsw5gv4KYKEZnJrcju0RolcCQudJt5IVowkkG5kl?=
 =?us-ascii?Q?n+nR812NcJi7a5170ud/Y+xNdxuHCJOGxiiexnWGeBHVmw2/OFS5U6HFzd8J?=
 =?us-ascii?Q?GLSmysK9mFSeLQ873iP1xN26xZr5K5U5lB6gBsEcVgZwKqVp9x9NIy3JbBam?=
 =?us-ascii?Q?uWJPOd1vDLQjYRhms3+ClW9L4QSHYHyNZXjiNARdQL2/0eM8E8dhmLovi3PT?=
 =?us-ascii?Q?WZII+mCMcM1J4R+ZhtKEhsPKUEBnmuqrqq/I1piUSASQGe4j/wvCGX97ayRd?=
 =?us-ascii?Q?xUBtTOirhWWPb0/j1psYpfyLuLYhOdBzO7M0etKKjzPyM1aY01SJRzNeC4D2?=
 =?us-ascii?Q?b04jC0GFAbRMqYRSQnwOjAcvQFqPD0QBPM7FMiov7grMFHmGlkcxU4mfSLpU?=
 =?us-ascii?Q?Yno2Hrq3K9btlebBjGyfu8K/Y8Scd7nyGARxN+dcbuT1M2RPGJLEYcK+UfFk?=
 =?us-ascii?Q?8I+HSnCAay+BcvdnxeZTlpIn+IlajtEZ86zJskbGbepeeJ91gsFsgyJuAvJh?=
 =?us-ascii?Q?bSpBuNGnaZTtr1BoFsbEiAU3gPsP9YDrp6PblzA9xrZ3D0AHIkDvqIlghlpD?=
 =?us-ascii?Q?Cn62HkQOYv/Vtu8ws6zZOiZ1Hl4GPwY3javbjozOounQ6CntK+eVQhrs64lH?=
 =?us-ascii?Q?ZiaxFBih3UXF0ttsOBPls9j+3NUrvbbT22ObBLoPupeh4rNjMMPeJwXM+6ut?=
 =?us-ascii?Q?FuKT3k8MfjfTRi+iVEk9jFSURG9ZrTinRuNbaZ8quxfaCmvd7AIMx3pqu9TE?=
 =?us-ascii?Q?e71sXzGY/PC5VG2j8G0tQuoKgDi9RLw4PnwXeDISP0St8Ht/PZCoPeAUQTZL?=
 =?us-ascii?Q?YQFJ96GMCVRulpW/gY6okiC+qhQuX5BoEyXQ5KG9VAR6uYPPzwXn65Pe6xy9?=
 =?us-ascii?Q?zPsthffo8RxAD2uKKeiMjW8zOjqGr0u0yHrQt1VAPjlrTBsji7T/Q6u2/fBJ?=
 =?us-ascii?Q?edGRoMS2CIc/qXfSLo0ohtZ+4MCi85I=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62ffd64-e91f-42b7-6a3d-08deee5934a2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6560.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 16:40:03.7363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4VkbcHvd/89J3i8VLJVelonyrNxeYGaIT2XxB+9XX2LZXyAkXexhi1HEZnHd9fEK1jR6TUfxeHmphHgKLuAtz8//31O19889QizhRyA2gA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7267

From: Hang Suan Wang <hang.suan.wang@altera.com>

The Agilex 5 Secure Device Manager (SDM 1.5) exposes an FPGA Crypto
Service (FCS) over the existing SIP SMC mailbox: a session-based
interface for crypto primitives such as SDOS (Secure Data Object
Service) encrypt/decrypt. The service layer has no command to drive it
yet.

Configure stratix10-svc about this interface so an in-kernel FCS client
can use it:

  - add the client command codes COMMAND_FCS_CRYPTO_OPEN_SESSION,
    COMMAND_FCS_CRYPTO_CLOSE_SESSION and COMMAND_FCS_SDOS_DATA_EXT (all
    asynchronous)

  - add the matching asynchronous SIP SMC function IDs
    (INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION,
    INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION and
    INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT) with their register-usage
    documentation;

  - match "intel,agilex5-svc" and register a "stratix10-fcs" child
    platform device, mirroring the existing RSU child, so an FCS client
    driver can bind without a dedicated device-tree node;

  - dispatch the new commands in the asynchronous send and response
    paths; for the SDOS data command, translate the source and
    destination buffers (allocated from the service-layer gen_pool) to
    physical addresses and pass them, together with the session/context
    IDs and owner ID, to the SDM.

The transport is unchanged: Agilex 5 reuses the SIP SMC calling
convention and async mailbox ABI the driver already implements, so no
new transport mechanism is required.

The SDOS SMMU-remapped address slots currently carry the buffer
physical addresses; SMMU remapping support is added in a follow-up
series.

This is a prerequisite for the SoCFPGA FCS driver, the first in-tree
consumer of these commands.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
Reviewed-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/firmware/stratix10-svc.c              | 58 +++++++++++++++--
 include/linux/firmware/intel/stratix10-smc.h  | 64 +++++++++++++++++++
 .../firmware/intel/stratix10-svc-client.h     | 16 +++++
 3 files changed, 134 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index d389be1c6690..73ffaed4c8c1 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -45,6 +45,7 @@
 
 /* stratix10 service layer clients */
 #define STRATIX10_RSU				"stratix10-rsu"
+#define STRATIX10_FCS				"stratix10-fcs"
 
 /* Maximum number of SDM client IDs. */
 #define MAX_SDM_CLIENT_IDS			16
@@ -104,9 +105,11 @@ struct stratix10_svc_chan;
 /**
  * struct stratix10_svc - svc private data
  * @stratix10_svc_rsu: pointer to stratix10 RSU device
+ * @stratix10_svc_fcs: pointer to stratix10 FCS device
  */
 struct stratix10_svc {
 	struct platform_device *stratix10_svc_rsu;
+	struct platform_device *stratix10_svc_fcs;
 };
 
 /**
@@ -1319,6 +1322,30 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
 		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
 
 	switch (p_msg->command) {
+	case COMMAND_FCS_CRYPTO_OPEN_SESSION:
+		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION;
+		break;
+	case COMMAND_FCS_CRYPTO_CLOSE_SESSION:
+		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION;
+		args.a2 = p_msg->arg[0];
+		break;
+	case COMMAND_FCS_SDOS_DATA_EXT:
+		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT;
+		args.a2 = p_msg->arg[0];
+		args.a3 = p_msg->arg[1];
+		args.a4 = p_msg->arg[2];
+		/* payloads are allocated from the svc gen_pool; pass phys addr */
+		args.a5 = gen_pool_virt_to_phys(ctrl->genpool,
+						(unsigned long)p_msg->payload);
+		args.a6 = p_msg->payload_length;
+		args.a7 = gen_pool_virt_to_phys(ctrl->genpool,
+						(unsigned long)p_msg->payload_output);
+		args.a8 = p_msg->payload_length_output;
+		args.a9 = p_msg->arg[3];
+		/* SMMU remapping is added later; pass phys addr for now */
+		args.a10 = args.a5;
+		args.a11 = args.a7;
+		break;
 	case COMMAND_RSU_GET_SPT_TABLE:
 		args.a0 = INTEL_SIP_SMC_ASYNC_RSU_GET_SPT;
 		break;
@@ -1408,8 +1435,13 @@ static int stratix10_svc_async_prepare_response(struct stratix10_svc_chan *chan,
 	data->status = STRATIX10_GET_SDM_STATUS_CODE(handle->res.a1);
 
 	switch (p_msg->command) {
+	case COMMAND_FCS_CRYPTO_CLOSE_SESSION:
 	case COMMAND_RSU_NOTIFY:
 		break;
+	case COMMAND_FCS_CRYPTO_OPEN_SESSION:
+	case COMMAND_FCS_SDOS_DATA_EXT:
+		data->kaddr1 = (void *)&handle->res.a2;
+		break;
 	case COMMAND_RSU_GET_SPT_TABLE:
 		data->kaddr1 = (void *)&handle->res.a2;
 		data->kaddr2 = (void *)&handle->res.a3;
@@ -1913,6 +1945,7 @@ EXPORT_SYMBOL_GPL(stratix10_svc_free_memory);
 static const struct of_device_id stratix10_svc_drv_match[] = {
 	{.compatible = "intel,stratix10-svc"},
 	{.compatible = "intel,agilex-svc"},
+	{.compatible = "intel,agilex5-svc"},
 	{},
 };
 
@@ -2016,20 +2049,36 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 
 	ret = platform_device_add(svc->stratix10_svc_rsu);
 	if (ret)
-		goto err_put_device;
+		goto err_put_rsu;
+
+	svc->stratix10_svc_fcs = platform_device_alloc(STRATIX10_FCS, 0);
+	if (!svc->stratix10_svc_fcs) {
+		dev_err(dev, "failed to allocate %s device\n", STRATIX10_FCS);
+		ret = -ENOMEM;
+		goto err_unregister_rsu;
+	}
+
+	ret = platform_device_add(svc->stratix10_svc_fcs);
+	if (ret)
+		goto err_put_fcs;
 
 	ret = of_platform_default_populate(dev_of_node(dev), NULL, dev);
 	if (ret)
-		goto err_unregister_rsu_dev;
+		goto err_unregister_fcs;
 
 	pr_info("Intel Service Layer Driver Initialized\n");
 
 	return 0;
 
-err_unregister_rsu_dev:
+err_unregister_fcs:
+	platform_device_unregister(svc->stratix10_svc_fcs);
+	goto err_unregister_rsu;
+err_put_fcs:
+	platform_device_put(svc->stratix10_svc_fcs);
+err_unregister_rsu:
 	platform_device_unregister(svc->stratix10_svc_rsu);
 	goto err_free_fifos;
-err_put_device:
+err_put_rsu:
 	platform_device_put(svc->stratix10_svc_rsu);
 err_free_fifos:
 	/* only remove from list if list_add_tail() was reached */
@@ -2052,6 +2101,7 @@ static void stratix10_svc_drv_remove(struct platform_device *pdev)
 	struct stratix10_svc *svc = ctrl->svc;
 
 	platform_device_unregister(svc->stratix10_svc_rsu);
+	platform_device_unregister(svc->stratix10_svc_fcs);
 
 	stratix10_svc_async_exit(ctrl);
 
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index 9224974fffc4..8e989b279bb3 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -646,6 +646,70 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
 #define INTEL_SIP_SMC_FCS_GET_PROVISION_DATA \
 	INTEL_SIP_SMC_STD_CALL_VAL(INTEL_SIP_SMC_FUNCID_FCS_GET_PROVISION_DATA)
 
+/**
+ * Request INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT
+ * Async call to perform encryption/decryption
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT
+ * a1 transaction job id
+ * a2 session ID
+ * a3 context ID
+ * a4 cryption operating mode (1 for encryption and 0 for decryption)
+ * a5 physical address of source
+ * a6 size of source
+ * a7 physical address of destination
+ * a8 size of destination
+ * a9 sdos ownership
+ * a10 smmu remapped address of source
+ * a11 smmu remapped address of destination
+ * a12-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK or INTEL_SIP_SMC_STATUS_ERROR
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CRYPTION_EXT (0x12F)
+#define INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CRYPTION_EXT)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION
+ * Async call to open and establish a crypto service session with firmware
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_FCS_OPEN_CRYPTO_SERVICE_SESSION
+ * a1 transaction job id
+ * a2-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_OPEN_CS_SESSION (0x13A)
+#define INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_OPEN_CS_SESSION)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION
+ * Async call to close a service session
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION
+ * a1 transaction job id
+ * a2 session ID
+ * a3-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CLOSE_CS_SESSION (0x13B)
+#define INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CLOSE_CS_SESSION)
+
 /**
  * Request INTEL_SIP_SMC_HWMON_READTEMP
  * Sync call to request temperature
diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
index 190d89d602e9..2bb751f3b212 100644
--- a/include/linux/firmware/intel/stratix10-svc-client.h
+++ b/include/linux/firmware/intel/stratix10-svc-client.h
@@ -7,6 +7,8 @@
 #ifndef __STRATIX10_SVC_CLIENT_H
 #define __STRATIX10_SVC_CLIENT_H
 
+#include <linux/types.h>
+
 /*
  * Service layer driver supports client names
  *
@@ -122,6 +124,15 @@ struct stratix10_svc_chan;
  * @COMMAND_SMC_SVC_VERSION: Non-mailbox SMC SVC API Version,
  * return status is SVC_STATUS_OK
  *
+ * @COMMAND_FCS_CRYPTO_OPEN_SESSION: open the crypto service session(s),
+ * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
+ *
+ * @COMMAND_FCS_CRYPTO_CLOSE_SESSION: close the crypto service session(s),
+ * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
+ *
+ * @COMMAND_FCS_SDOS_DATA_EXT: extend SDOS data encryption & decryption,
+ * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
+ *
  * @COMMAND_MBOX_SEND_CMD: send generic mailbox command, return status is
  * SVC_STATUS_OK or SVC_STATUS_ERROR
  *
@@ -185,6 +196,11 @@ enum stratix10_svc_command_code {
 	COMMAND_FCS_RANDOM_NUMBER_GEN,
 	/* for general status poll */
 	COMMAND_POLL_SERVICE_STATUS = 40,
+	/* for crypto service */
+	COMMAND_FCS_CRYPTO_OPEN_SESSION = 50,
+	COMMAND_FCS_CRYPTO_CLOSE_SESSION,
+	/* for extended SDOS encrypt/decrypt */
+	COMMAND_FCS_SDOS_DATA_EXT = 82,
 	/* for generic mailbox send command */
 	COMMAND_MBOX_SEND_CMD = 100,
 	/* Non-mailbox SMC Call */
-- 
2.43.7

