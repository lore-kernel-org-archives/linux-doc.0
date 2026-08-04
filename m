Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A4A3F076E
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 02:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785811728; cv=none; b=h7VtuX1zgHtA6wrALEA1C/OVsejvoytwBgG3CG8J/lJ5i43IvSu4b9bV+ruckLSPrgMkY68hOVbiEPPsIhyQi9Lfw4slzEMaE4yKQObWzF9sbNGjHPVqWA+mqv0euriS2rtq1hvW2P0D1XVHYo1kvAz9OFOmrAQ/a3/opv7lGlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785811728; c=relaxed/simple;
	bh=vfEfXnWX5XRHIG7xa/1KehCRje8+hVCYEYPeNc+IHz8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O9vxTdwXHC+/hU9kqkaGGxAKy2xziBdCgGA5hL47Np8+RpEqgkyRAaskCY8r/UsHZY92y7lcC806jK5t+7uezT+SQPuSv0l5gea0pWjgmu0Y6LHmVPQCXiniSq3ka0/e+1ay8LnVbRpvIIg2+EvCR+n1d0FvKmf5uBK11Sta5EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXitUW0/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXitUW0/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ceaf8a1265so48600185ad.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 19:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785811720; x=1786416520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uu48l08iOiq9g5Bc53dhkabEeR0zOJy6W3JS0tzyMbo=;
        b=PXitUW0/qXsXIMqaO6h1XO7121mUhNpHLaTTn8Bz4yGMm31DRFeeMOUOzGBlPDHcek
         V7IAn0i0y53QzTFOlr1vSNonF0AUgRhZTrHLl6ZDi12oauQaDBgzUDGJsxfwkr07ViO2
         gaORhLlQbF/Y2pHm238jTkBXL8jjAv/460uujpdvcJbBiLtIeyiPG6LWAMl2+Fb3SdnQ
         eW7MNVneO7XgSHFEZKoSiAqIj12Awy2/Dn3UDVCbnqPsHZBm4kX4steDCA3iav8X/FUd
         N69WTmCe81MdRPIv1adkYyN8VoAcdFB1Yt0NjXc6gVMEw4DvDMZxPoiLQubUG9AoxuoE
         Bihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785811720; x=1786416520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uu48l08iOiq9g5Bc53dhkabEeR0zOJy6W3JS0tzyMbo=;
        b=FjBS83u6TcwKoaSQ/FgoMsfEYoWWYtyVaCiWl6jGSC8kR3GkT4/nG50SoCF1JzEhUG
         PEWX+UKqEze2W3pZNtJewyBpZRZ1Ca8crtKFfPt+eT4JG5Iis3akYeXSs3tahYmdSiS5
         IpJ5qHbuiQKmqO/vT+mZgs1jpc9uOQgfquCfDcgU1ZwFBZNGhC52oWAxvXKsrFZqrI7l
         9MHDRdmcEiX4XtlhorwQd3o2bnhoIoz+ELEbyEzoQvCkhsU3mxqdW81NHOqBzIqeZsXK
         N2Knlfh5duk52IO9EXfzXXk6DxaCcMIRBIaf2MEl4tkHO6e/hvpTlNY2tPTGVoBj5jHa
         pGcw==
X-Forwarded-Encrypted: i=1; AHgh+RoPm5iLb+Ui5EAPLCHHkamZ3GCQaBokmpwXxS9teMkGVrqThEZzNsg4K+kB9AGLzUo2YrBxwj4PN7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfyAqVb1Sv3wwPstGmoDApgEhgEMd/xs+vrcpZwsCIU0pF7Bve
	vqc8nxpcwZqZnN7UMHsqhMIUQuQTfWwtL/8Eosuy131s1eX7PlNzWEaG
X-Gm-Gg: AR+sD10WziwSlxRrQJkvoMEce/fP5IkRoCQgULeWPZHNL4XHieT0vUe2LNQdbgRGDI3
	30MoVaXdyqaSnwK6hjqSMpQN+ZpLkIU0/Y/U4hg5yyvTHeLfameiQiYm+Q1QKEqmMnTQOdnaGIl
	gKjQ8Xyl7gUD/pDX96ieqMZASLifWM1ZNXaMbvtkauH+8esNR6njJg95cJIpDA9n6pUjJHC0Cd2
	9UJGKpd1m7WCcuAJXs5kOhL02N7reAkbqJseiqqYzL0He+o0FvNkNwJdUFmwdeuiRv0Dxg3scMx
	spFjMcRHqFcoOCHtgXSiF1gvTMpan49OCDItmXxNIQAhEi3XGsQrhVv/kSfmSo8mL0RDIDh82Xy
	oLiuvuLGqp7aem7EngId+ljRCx4Bu4n0W9vYc9XjoZmUaJZNSn0m4G9BjhIVJELmQ01TYyRKzq9
	wI7afcemzbHu6HkJm+bai9C1/G7LOWCat4Pjn+8NhT7v17TpQG2NKFSBX7GFxIaQh5m04mkIG75
	XQbDXc=
X-Received: by 2002:a17:903:4b4c:b0:2ce:6d4a:5b8a with SMTP id d9443c01a7336-2d05242c4a2mr121069295ad.38.1785811720247;
        Mon, 03 Aug 2026 19:48:40 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5a91asm44837315ad.21.2026.08.03.19.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:48:39 -0700 (PDT)
From: "Yuhang.Chen" <yhchen312@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control VS-mode WFI trapping
Date: Tue,  4 Aug 2026 10:48:22 +0800
Message-Id: <20260804024822.2401012-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAAhSdy2r8Ei9ESdSJB8McC1T=Atp0yNa2MxEbOWNVRTUM_8YFA@mail.gmail.com>
References: <20260709115610.287420-1-yhchen312@gmail.com>, <CAAhSdy2r8Ei9ESdSJB8McC1T=Atp0yNa2MxEbOWNVRTUM_8YFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Anup,

Thanks for the review.

On Tue, 28 Jul 2026, Anup Patel <anup@brainfault.org> wrote:
> This would mean that for the "notrap" policy the VCPU would never
> sleep and increase host CPU utilization even when VCPU is idle.
> Is this expected behaviour ?

No, that was not intended. With "notrap", HSTATUS.VTW is cleared
unconditionally, so a VS-mode WFI never traps and the vCPU never reaches
kvm_vcpu_halt(); since WFI is only a hint, the vCPU thread can keep
spinning even while the guest is idle - the high host CPU you point out.

v2 drops "notrap" and replaces it with "auto": HSTATUS.VTW is cleared
only when the vCPU is the sole runnable task on its CPU
(single_task_running()), otherwise WFI traps and KVM blocks the vCPU
through kvm_vcpu_halt() as before. The default stays "trap", so there
is no regression, and the policy is re-evaluated on each vcpu_load() so
a vCPU that stops being the sole runnable task switches back to
trapping.

So to answer your question: the vCPU no longer stays busy at the
expense of other tasks - it either blocks through kvm_vcpu_halt(), or
runs WFI natively only when nothing else needs the CPU. On QEMU TCG,
host CPU stays around 5% while the vCPU is the sole task and rises back
to the trap level as soon as a competitor appears.

I have posted v2 as a new thread:

  [PATCH v2] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control
  VS-mode WFI trapping

Regards,
Yuhang
