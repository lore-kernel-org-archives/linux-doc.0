Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8B636829D;
	Thu, 30 Jul 2026 16:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429609; cv=fail; b=Kij4+xdm/AHSKOJDKaxETp7pQVUUqLnN4XKz6avW/wA43lbo9DPWzgJDiHTX4cprtTyHpga7YfwbahQyUSYhX6+n0GhVfjXOU3+6ApSH5goAKoM6nqZpkSkt25jfdtWvhe2ghWPmue8ElEgeFbp5JiJXjF7QTs7jbi7db9G2e20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429609; c=relaxed/simple;
	bh=Qac7tKkXdB2oShN5XIcn56ksIGNIDecv0BBLNAtie1c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cE+1QyCO4mC8aWrb5q8q6cYj/xWYppNuvd+Cg/7IRm9H7s44na6th/ayPBJ7W0r0wTdiOapgBhmAdj45Tar9iR8Ls3goGvCcTECMPYUP0lfTueEw96WdOWcJPbNbhtdoStczU/mgsMHCIliLdIhbFgngQM5MKJjR4hRQ5Lfo1Ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=UkKlo7Hy; arc=fail smtp.client-ip=52.101.56.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="UkKlo7Hy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWbjvcbin3L/ehTgVFtHv8ynsHDXkQRznzd0oaAvN3dRvJxqb0NoHosN7QCfqH8WUVfPy1W83GUfY4VhoqdB8L9opjNXLFzZz4DASRcZbNDtj7okwzKJIuqfi+CgiWzyUg1P41MPlO0v8IhRIIXZMGKe8vDieVAh2SG//MNpXIotbOOHvV8Gwunvavbtv558f2qw+czeFyyrQi4vSdb5zMWRdnJyKTv8ROy4kxNCCiEZoBtUFShLHSbrRvHIY4qYhpSeDZXnnGYbjWDJ9531vBYEg0+QNdc4/xX1jotaR6tNdMoCpgSbSfA6a1zRhS/kU6Y//6zjAkEnk4raGB3oWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmuBw/8OQbnVuPtOktI1tUiYAggyeWnvz0iBROm1XKY=;
 b=XV9PKln0ynohyqQIFpnFMc1H9ugUVyQ4NgbprmKmw31Wc5hT2K3k/2ysHx32QgjxwPlcB9RM6fgs8KCH4ijtKbfx1MfrqsEz9D5x50TeeRf+6gHc8ylo1o+h2fK8N4DCfiOKZK1pKSuceoMqPRmZ4vnQIdYyItAqp/wFFgTLTsdxAPpkRW56eSCS3wyHCP5lPI8xU3mab8q90zrHYeeAnh4Cl7NMrk3UQUcMj8Z/4Tx24mKocaBBd700LcWeOJ+v1/z/vBJpJs1r7Q2sd5Elw1z/aCxlgWLFDWzsRqLWbtlGfvtJLeVRAlees/FjWvWuWGhHOgDIdqgnPfhkSA0/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmuBw/8OQbnVuPtOktI1tUiYAggyeWnvz0iBROm1XKY=;
 b=UkKlo7HyO1+lg0WBcALHzstp48DmqnWeQP8kl3ivoIwd8RqKUhJrbTQpOC5/8NTjnGzxbwMYA0Jr7AUbC7pTv2QyrrOPt2+9xgtN4B59rIpWzqQr6s1BjPKhnzLastTDxJFonD7TcnVku03Qs8UZVoGjWOabTOft09kDV4SjHb4yqz6XZfZTWbjOvA+l1TwY4qZmOw3+JHq63NxaJPHbCxpBvhsyTRR+Kl1PxByewh+gCwzW+PGbKytcUMcQZhjV+NoNpastyzYJrDxyGoXRzUA9Ry4mqqsJ32+Wqq+nhG+Zj9d0Xm1mCqi3BqNsnSN9rKr/MNoFP3PEtngLEZqFLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6560.namprd03.prod.outlook.com (2603:10b6:510:b2::12)
 by PH7PR03MB7267.namprd03.prod.outlook.com (2603:10b6:510:24e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 16:40:02 +0000
Received: from PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b]) by PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 16:40:01 +0000
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
Subject: [PATCH v3 0/3] Add Altera SoCFPGA Crypto Service (FCS) driver
Date: Thu, 30 Jul 2026 09:39:56 -0700
Message-ID: <cover.1785413906.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
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
X-MS-Office365-Filtering-Correlation-Id: a0ec802e-b5f4-4614-15db-08deee593389
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|56012099006|11063799006|10067099003|6133799003|55112099003|18002099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
	i8ZsSrA6a1pr8/I0pU3jzgmHIgi68RbhYKdleBas37kzpcJkcI1rknHoWDsIBjb9DGruqIHvsJbIFKzjPtN5VpIg+BMLsTVaQ5n1tzSmVLqXbTw8VuX1AjNPit8ISVm90cMI3kRad01VabMNAGJftnmQr5zKM2Kh7Tt9qjQ/ihbBznxViHICqOn4OF3LCKzYpdI/9HP2zDpr0jjxWmgx6d+Lp3BOy8DZJF7e6KdmXKVjqI17lI9wsKcWhqMBswTFB5JxHwYIDT7w74u8PDj8tbSa5+/tbDEBUSL8D4/HZvMhPP4VBaWNcqvtImlYpo4oVFwFDSrshXnWIpe5/949ePwHCcqxfdjD3OV51nj35zq/HAoTMSe/T9lXNryCygcqrAjsi1jNaxUl7//eN7+ZDs8G43mSVmn0dhF6o7FTcEfSm3itvr/or904q722hPAXMb/JW+Mi89qL5BklYNx+nD3cs3Pncv5IrjfAptvKjO8FtjUjAxBx9QC4DC8OJXYkR3lkeXO4W39MwFdD78iquz6RL7zZwc40hrFUcut6rsy5Y1LOSDBZaeb+McEI9sN+Snnd1rT47juNYCZ2fxeECF8RjzMWiFcDQse4qocem4hl1PrM+Y/DkJfQHMZzZnwhpZChykI/2ilA607m8QoFFJhEDrggLYphihfZADxePmHFvpxhwonQedp5TCcCITAEcc5/k8IpWY3j4407enaLJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6560.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(56012099006)(11063799006)(10067099003)(6133799003)(55112099003)(18002099003)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BsWR5kYiwhUmw5kMnkIl44XtjihPlr2/05p+R4gDlmKSMHlCc6qqFy+GmTBI?=
 =?us-ascii?Q?fPggIdyiYej/tLAZB8XA5/cWxZg4FxO+70zWy5Bo63AHGtp62pMzx/EV4WAa?=
 =?us-ascii?Q?v6PKP4cZJ2sjK5vk6BY/mTAc9UUVia4ZRcCzmVR52AQ7Zgcdq9CyElxX4Y0n?=
 =?us-ascii?Q?hSfLQ8UtHvupVBOsKuJLwdLgpJV7e/2/6hCnf3HeKZfAeyHej1myqcfkWqnX?=
 =?us-ascii?Q?bnFVF9DRGGNT0ZA3l/ca8R8SqWaHENoAXtDgN5EaUDY71DcdhDTEf/gdxe+w?=
 =?us-ascii?Q?TCJxUrZOZXlvjxDlLFNS706u7dNwzpKMl57XD1QBsCkgWS0OxYsZA57bcl9B?=
 =?us-ascii?Q?/HXb5IUgNL/6/TtsoihsVhttHziBJvYy2Y9qmGuhYsmOtmdKK551KcMDZovv?=
 =?us-ascii?Q?IZNLBUahlmke03DqTQz3q0YMROyGykOne7x6a2dit805MD66vAwQ7ufxLuc5?=
 =?us-ascii?Q?avhvo/jwE8UoDwuABNKBr7BZLGfz9tLaPN9qC4xnLgrNVr5E8bbXegwIvwq/?=
 =?us-ascii?Q?4toz7yXhIuHfnsDqqMm2FmWB4Jr381GSx/ZQUR0gIWXo4pzwV/lk2ZzzKPRq?=
 =?us-ascii?Q?6LneCO0HZQfxdE7l9nxjz7AbFBAvIsg0Vi6bLkirFYj4KD2noHoKgJRDqmUc?=
 =?us-ascii?Q?zpGij7LHyNUjdiHQAAyrdOmJyjRI80LG7U5yv4LqeSjXNN37VX0rb4+SyZU4?=
 =?us-ascii?Q?26ySFjXKraF6Z3lD8QM2Tah6aNZaFgiqF3NvNWbeQYij69cA6VbKCFK0wd8w?=
 =?us-ascii?Q?9jmwxQSkS9DHzG3Z/jXFFJWViUIz9RupooboUzbD4zpwbArDeDbZVtNfIrHo?=
 =?us-ascii?Q?hRKoiE+qzh+Iq8HZf8GoRneQ0dxl094lKYV5Gla6zFhXi+8NVYed1MneWqTf?=
 =?us-ascii?Q?EDRKmRSqinqQ7Zu3Z1hWKHWak94X/kKtElNu/AFyTpv1M9BqMMxH/J8nI1tf?=
 =?us-ascii?Q?HEYMwsTY/bBHspJe1ipOy9qtuAclQKMqqa7uObYsuvVfBZrQBUJ45nQAjrTW?=
 =?us-ascii?Q?u5TOfKA7lPst81jf8Qxs5leHPF1rDT91Kyx/x6lDME4VX6Zn2rB63wkpZ7qh?=
 =?us-ascii?Q?JGHlBFrR6MVC5z31oeII/3inHPrPMCjPO1Rz6A8ESICKFyaZvzoyyS3Zpccj?=
 =?us-ascii?Q?6QCM0O5uRY44O7ujTqG2ieKXg3GMFVU6aydSUdExHtd91ZSaVP6tkhFn8Zyv?=
 =?us-ascii?Q?cGqCd1sKtWlEYmU/p9YAjPQhqt6NF1D9a9uSJBOhE0WZvRos2Ps1juDQTgs3?=
 =?us-ascii?Q?yvGSvX1j6SAU27kOGqb+ppUxgc1vs2entnbddZjjDgZwCBGAq+bWRyzq7msy?=
 =?us-ascii?Q?/xveVntT/U5ckBeacYzv1Or9ygTyLzDEcQWxhlRZvvJVIXfwq48slEv04rkv?=
 =?us-ascii?Q?hChdolXLqLNtxZb9lTFKt71f6PyzMRYGkeRGXtfbTRKVarLMI95YKKTc7/VO?=
 =?us-ascii?Q?4yuYVG5Q1fniizYea0CB+zXS/1WtanedzMoNbcy/Ddg+8g8R5MaAh7bcWqdL?=
 =?us-ascii?Q?7SxE3YGMjxKSsXovTp23iQGkxhQlQ0WDXtvOr1SVzqbIBbOuu2AEkk+l5TLU?=
 =?us-ascii?Q?vrmddnh31BJXnXn9An4NfVC9kND6AwF0w47g13cho+p8iQIU+eqtIdmPYtbu?=
 =?us-ascii?Q?ZKdYo8lRTqBl1qYaCxSeV/8fvtnyPeMOsw5PP9dW1AX5VabBsRliyfzXUMvA?=
 =?us-ascii?Q?+JkatlGLJNNTFUjC7Q7ZIwCmfBKPIZ5VT7njUhm3hnDY1jQ/N49giRxBPUlK?=
 =?us-ascii?Q?KXDjkYPkxm9DqthgmdJkMCzdqHFif8c=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ec802e-b5f4-4614-15db-08deee593389
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6560.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 16:40:01.8318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzQB2pJ9UlzlsIsit0Ssa2L1tSukPZqkXnrQcew+S1PBnBLT5Wj+q9Itd89SEoeTSIZpDHNOOPI1wOoIAE+r/257sPBTArC1YDdDkYEqw+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7267

From: Hang Suan Wang <hang.suan.wang@altera.com>

This series adds support for the Altera SoCFPGA Crypto Service (FCS), the
runtime cryptographic interface provided by the Secure Device Manager
(SDM). The SDM is the hardware security controller in Altera SoCFPGA
devices. It acts as the root-of-trust device and controls access to
built-in cryptographic hardware such as AES, SHA, a true random number
generator, and Intel PUF. The SDM is responsible for security-critical
functions including secure boot, FPGA bitstream authentication and optional
decryption, remote system update, and runtime crypto services. On the HPS
side, software reaches the SDM through a mailbox interface exposed in Linux
via the stratix10-svc layer, which uses Arm Trusted Firmware SIP SMC calls
underneath.

The FPGA Crypto Service (FCS) is the runtime crypto interface provided by
the SDM. It covers services such as random number generation, AES
operations, HMAC/SHA, key management, attestation, and related security
functions.

This series implements one FCS feature: the Secure Data Object Service
(SDOS), which protects sensitive data at rest. With SDOS the SDM encrypts
and decrypts data using a key derived from a device-unique root key that
never leaves the secure boundary, plus an SDM-generated IV. The host never
handles raw key material or IVs: it supplies plaintext and receives an
authenticated ciphertext object (and vice versa for decryption). A primary
use case is black key provisioning, where operational keys are installed in
protected form without ever being exposed in cleartext.

The driver reaches the SDM through the existing stratix10-svc mailbox using
the Arm Trusted Firmware SIP SMC transport. Data buffers are allocated from
the service-layer memory pool, which provides physically-contiguous memory
whose physical address is handed to the SDM.

The series is organized as follows:
 - Patch 1 (prerequisite) enlarges the stratix10-svc SMC argument array so
   the asynchronous FCS SDOS command can pass its full set of parameters.

 - Patch 2 extends the stratix10-svc service layer with the FCS command
   codes and matching SIP SMC function IDs, adds the Agilex 5
   (intel,agilex5-svc) match, and registers a "stratix10-fcs" platform
   device that an FCS client driver binds to.

 - Patch 3 adds the FCS firmware driver implementing SDOS encrypt/decrypt,
   exposed via an ioctl character device (/dev/socfpga_fcs); the crypto
   session is opened and closed internally and is not part of the user ABI.
   Thus, patches 1 and 2 must be applied first.

Testing:
 - Built for arm64 (defconfig + CONFIG_ALTERA_SOCFPGA_FCS=m).
 - Tested on an Agilex 5 SoC FPGA board (SDOS root key provisioned).
   SDOS encrypt/decrypt round-trip; the decrypted output matches the
   original 32-byte plaintext:

   root@agilex5e:~# hexdump -v -e '/1 "%02x "' secret.bin
   da 21 01 c5 d1 72 85 4b e7 1f 72 8f 60 68 f0 c9
   33 08 9e c1 9d 69 4a 54 61 0a f6 90 58 44 c8 17

   root@agilex5e:~# ./fcs_client -E -i secret.bin -o enc.bin -d 0x1234 -r
                    0xabcd -n 0
   root@agilex5e:~# ./fcs_client -D -i enc.bin -o sdos_decrypt.bin -n 0

   root@agilex5e:~# hexdump -v -e '/1 "%02x "' sdos_decrypt.bin
   da 21 01 c5 d1 72 85 4b e7 1f 72 8f 60 68 f0 c9
   33 08 9e c1 9d 69 4a 54 61 0a f6 90 58 44 c8 17
---
Changes since v2:
socfpga-fcs (front-end):
 - Replace the sysfs store interface with an ioctl character device
   (/dev/socfpga_fcs) using a fixed-width UAPI struct and
   compat_ptr_ioctl(), fixing the KASAN out-of-bounds read and the
   32-bit incompatibility of casting the sysfs buffer as a pointer.
 - Add include/uapi/misc/socfpga-fcs-crypto.h and register the ioctl
   magic in Documentation/userspace-api/ioctl/ioctl-number.rst.
 - Add a .release handler so a session is torn down if the owning fd
   is closed (including on crash).
socfpga-fcs (core):
 - Manage the crypto session internally: SDOS opens and closes its own
   session; reject a concurrent open with -EBUSY. Removes the
   user-visible open/close-session interface and session UUID, fixing
   the session-exhaustion/DoS concern.
 - Harden the async poll loop: keep polling until the deadline and
   always call stratix10_svc_async_done(), fixing the teardown
   use-after-free from the previous -EINPROGRESS early-return and the
   needless full-timeout block.
 - Clear receive_cb only on the synchronous send-error path so a late
   firmware response cannot deref a NULL callback.
 - Set priv = NULL on all fcs_init() error paths so a later probe is
   not permanently rejected with -EBUSY.
 - Read the SDOS owner ID with get_unaligned_le64() for correct
   little-endian handling on big-endian hosts.
stratix10-svc:
 - Enlarge the SMC arguments array so the async SDOS command can
   pass its full parameter set (through a11).
 - In remove(), unregister the child devices before
   stratix10_svc_async_exit() so async_poll() cannot race a freed
   handle.

---
Changes since v1:
stratix10-svc:
 - Forward result registers (kaddr1) for OPEN_SESSION and SDOS_DATA_EXT
   so session ID / output length reach the client.
socfpga-fcs (front-end):
 - Publish sysfs via driver.dev_groups on the platform device instead of
   a raw kobject under /sys/kernel; callbacks now get a struct device.
socfpga-fcs (core):
 - Convert completion timeouts with msecs_to_jiffies(); drop TIMEOUT.
 - On SDM-busy timeout (-EAGAIN), abort without async_done() (no id
   reuse) and return -EINPROGRESS.
 - SDOS: on in-flight abort, leak s_buf/d_buf instead of freeing to
   avoid corruption from late firmware DMA.
 - Validate the caller UUID early in fcs_sdos_crypt().
 - Enforce single instance: -EBUSY in fcs_init() and priv NULL-guard in
   fcs_acquire_cmd_ctx().
 - Drop the always-zero platform attribute and fcs_get_platform().
 - Set/clear receive_cb only around the synchronous send.
 - Use device-lifetime priv->completion for the async path (was on-stack).
 - Use the local ctx snapshot consistently in fcs_sdos_crypt() and
   fcs_session_close().
 - Point sdos.dst_size at priv->sdos_output_size, not a stack variable.
socfpga-fcs.h:
 - Drop platform/AGILEX5_PLAT; add sdos_output_size.
---

Hang Suan Wang (3):
  firmware: stratix10-svc: increase args array
  firmware: stratix10-svc: add FCS crypto-service commands for Agilex 5
  firmware: socfpga-fcs: add Altera SoCFPGA FCS driver with SDOS

 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |   9 +
 drivers/firmware/Kconfig                      |  17 +
 drivers/firmware/Makefile                     |   2 +
 drivers/firmware/socfpga-fcs-core.c           | 660 ++++++++++++++++++
 drivers/firmware/socfpga-fcs.c                | 227 ++++++
 drivers/firmware/stratix10-svc.c              |  64 +-
 include/linux/firmware/intel/socfpga-fcs.h    | 126 ++++
 include/linux/firmware/intel/stratix10-smc.h  |  64 ++
 .../firmware/intel/stratix10-svc-client.h     |  18 +-
 include/uapi/misc/socfpga-fcs-crypto.h        |  29 +
 11 files changed, 1210 insertions(+), 7 deletions(-)
 create mode 100644 drivers/firmware/socfpga-fcs-core.c
 create mode 100644 drivers/firmware/socfpga-fcs.c
 create mode 100644 include/linux/firmware/intel/socfpga-fcs.h
 create mode 100644 include/uapi/misc/socfpga-fcs-crypto.h

-- 
2.43.7

