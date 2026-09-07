Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623D7478
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 03:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788750619; cv=none; b=BdCfaWlShC6eMxL7USb/BJw3zaSufQ7+xb8jRytU8EcGErsH6KGLFmC98lvJg2IUMvdwmtsilA3C4/FvfFEdy4OCSGLwjg2+rp9OYHuzhQCaX/G89gfltRdQ6cDCgcumC5iFdOynFgoX7dXvjImxKnVO9xT2ibiCnV7B45EBqoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788750619; c=relaxed/simple;
	bh=coBiLsVIwfuN4qqOxrygjHvNyLnYxFxydliOkoeyub4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=f3bzg90XpZzgtCLtyfLh3+kYXix5ZRMPMR5deCVNq7vmePrnAXI3BQPD/0qAHpfgySq45DwMcdQSynTbbjEjgl/9H0ekXU+lLhlF6My2xr1vX3WX1iZX1WbDSvmRYrna0qAf9ujvLl88ys+smb8zHPBQifkv61byVWbXyalesmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FisZoGnP; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FisZoGnP"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d01663d816so20478505ad.1
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 20:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788750617; x=1789355417; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HIclRrkTtHr78xyYNTgEMTIC/Gv1UDVrXFUeoZXXUfA=;
        b=FisZoGnP3n02loKXsUezNBn2UgGYcQwYK0h5Qxo/msllXrGyF4TYPzL/KtrbLyMPnd
         5VjEp91rnebqB3z1wqfYLwlFsiJnB+Lk/YO/MMhKQ+lFHaaBldkq/qC29JhDQ6n+7TCo
         Xki93rcUGIDAzpDhijZAXEZNYkvK3VO4TXEiYmjgMkoUnEjmxpWiXIBgbUMPwWLIc8hY
         V5kuMyIdY5kLUVPlZJOf8AkdhYAZPaCORZqsJUv3sWWLPd5b5Ng2mbWTwySldX5bRFIB
         +lfiszsfqn/bhtWeoA4L/buQyNnzW9AiJRfiscltTvikhBPlJHi94CdUvraC+23r1t6y
         gNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788750617; x=1789355417;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HIclRrkTtHr78xyYNTgEMTIC/Gv1UDVrXFUeoZXXUfA=;
        b=mt6qZ4sELwG50Ef1Lk+skF4054xL5ezgvfqtS83mFH8PVBRcjCFGd7r3YN4KlYxREL
         5cE3/tUSjtrj67kPsjc1UvzJWPfn4+XsAtN72T53rTA6Vjq83MVeaKsJT0m+dn8dXyHE
         YD/XMRBnJJWdVEy/Ust9NVMHdDOFi8sVzrjaze+N//LskXzQLRLSJhKTwhH5jDx6Tkwh
         3Q1ayEYJkvAKEiNIImR45gv2EKE37wMI4FkREXP2Xq2DAfoRSPaph9dIlSa4eURm0hMH
         cElcA3rZ1rq6W0Lef6xh9sHNEkRy/oyP/wQZxwZOpA0vDFtBqHT9ZwDfxjWc+e8eQYoC
         bWyw==
X-Forwarded-Encrypted: i=1; AKwUvBwcaEy3zAXiEXWFjAYBPjiu/aYgRCLahEkBrFd6IUA3qEpuKFwFBN0zuy6FvjJWXd+eb574ChZGfy8=@vger.kernel.org
X-Gm-Message-State: AFuF++kk5V7M2Tn+xQDdABVaPCZz9gHGxWtsSlLUPtDssR5Cm+KBknGQ
	mULlhwlA0NgEs4THVm/A6Brv6e4y53lkr/xMddtDOy7KVXX6FvnieXlKEvVL5Zx3
X-Gm-Gg: AYBFou2Qjjecn4mTA3BeM0ezmL7SupwdZSf1pWmTEn6P8HWwSCIAACgTV1sOuPCIajq
	C22nlbBxAqaTQZ1z2m/5XF7+i5+oMSPW0oqU8c56zc/1x3TF60hnaB1fNOzuYZ3s3plXVh1Rl3U
	cWlVPA+d31jE5YJAK22jA+AXOfw7rFOJhzo+6ODfvE5cnBikO5i5GL7UWGWHbg3RcPjaUJ78nGD
	BqtKmRYazjAzBWCN2zbYkHFHEN3xd00BJNQ070ShSoMztLQzMTH3nSFeFVKlC0130ub7m9teuld
	MoYuCc4SjW7vvx7ZWK+R6jNJ/HYr3t/2cFmOKGOJo1WF/ea1/7qts1YyMb74evq6WcVqG0vEFh5
	hOPSsxZKnlLc2p75OYse0ZQsrVxOOT7DNTs0NhAywHBj7dqgBzbqO55DPePVXUNbMgy9kwQIuom
	oaRJ+Po1uUN8Q5+5+3R6hlOGiSfemHmxG6PAURL9PPzpSyaVrfS6fc1OdEEtDvCx3wxR4U/Lip/
	OHqmDiKkGze32phK/pB0jQ9I+E24OQ+Zl7qOT90AADG
X-Received: by 2002:a17:90b:560e:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39b261e7931mr31545148a91.14.1788750617002;
        Sun, 06 Sep 2026 20:10:17 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm19875155c88.6.2026.09.06.20.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 20:10:16 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Haren Myneni <haren@us.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] docs: powerpc: vas-api: Fix the structure name and the ioctl number in the example
In-Reply-To: <20260907004925.10948-1-kmehltretter@gmail.com>
Date: Mon, 07 Sep 2026 08:37:19 +0530
Message-ID: <jyox21zs.ritesh.list@gmail.com>
References: <20260907004925.10948-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Karl Mehltretter <kmehltretter@gmail.com> writes:

> struct vas_setup_attr does not exist; the name is struct
> vas_tx_win_open_attr. The example also defines VAS_TX_WIN_OPEN with the
> request number 1, while arch/powerpc/include/uapi/asm/vas-api.h has used
> 0x20 since the ioctl was added.
>
> Use struct vas_tx_win_open_attr and 0x20.
>
> Fixes: c12e38b1d52e ("Documentation/powerpc: VAS API")
> Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> v2: also fix the ioctl request number in the example (Ritesh)
> v1: https://lore.kernel.org/r/20260905104313.43620-1-kmehltretter@gmail.com/
>
>  Documentation/arch/powerpc/vas-api.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks for fixing the ioctl number too and sending a v2.
LGTM. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
