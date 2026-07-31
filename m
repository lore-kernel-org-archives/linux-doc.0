Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E41367291
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 20:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528612; cv=none; b=nwP+nyJYs5cO34ZYPrsyE3dqVIAORDW5Jy1RtxkEMOmiLfqyza8nb+2TPyitdEuL/+jVZGNzSwEw9YlrZw9CcEZNLYtNH2IEDfz0vL1LAWSS4Ba3kqR16mrebtMxEb06Y2isQu7rMdGldPw9ScrL4y3ZXAUap7rjgMm5eRdFUAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528612; c=relaxed/simple;
	bh=EbkAtw/yPxzI+zkDqTO3nDCw8wZaoKCV5tUxOPgLNqc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=GmkQELnAx1QiAB9nrFYBRUQd/YIVVDGR5tk2pV0ZCdvDbjLjpk4INpIF/dJi1Gq9HwkVp73bcNFPkYZBQ0lf7M1SKef490beWMAEfPtqnRKhGwG7RjbawWjJz5lVvzBXH8Lc5sTdGE90iQh+EZFSDkBMnOac7baRiu+cedJVQCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ht6aABe4; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ht6aABe4"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8487eb67173so2723287b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785528610; x=1786133410; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dGHZhChNpAHEZYB2yzeExiUjrKbT3b7Zh2GTXyKqp4=;
        b=ht6aABe4vis8On3fu96U99CiJNUmrPLStFDPjy8N7B8P1hB9xGtroPwA33xEe5WRHL
         t3yqX2CCwKApaAviqr41tHdgarFt/2K2qXQWjYjWpXboVUcpkW4S+g2uGmtUKwGMGwXA
         jkFewdWgs9OJm5U/qcwHpSg6SfElsw2Z+FP+wsutneJiUpsyuHGe/zX8hxVtoZctbcFv
         dmHaeh/q7J50Ngij9dB4qRYXU/gPFwn+gRVwoKmt1k2GRDmId5tHrTXiR1TWz4YB/eMr
         QayLsOmlML/rG1OqkOlXpCQDL++DjSQlGVbhFzdc9rAPkGkNYxDO8gGo0aVQvzecX9io
         UFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785528610; x=1786133410;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dGHZhChNpAHEZYB2yzeExiUjrKbT3b7Zh2GTXyKqp4=;
        b=Na9yQ4IByx8Sg2+3X6ZcEKl0tbJU9WEs9Om0SI7+eKPabpe4U7wzBSXtpbMp6DRfNU
         FllOs6GeiLneCezOL5tP9YNmysb8CR+z8O4AUnZgvuJC4DXKBIFo05pJNfsmQ+Y/3o1T
         fePu0PbaUHFvsi1QIvFyua2g1wPXmXx8oBtsN4QjNjx0FJlmj5Y259zRUoHj4W3GjsJm
         sMkoi+MCG7FmeCkxgnZvVvlP1GHGsOGtBpIPkntfuAMytNhdoB89U3N79eFWhaki6yNL
         kgs9hgvaCmTsV9lsvIFXw6PGi2m6tjT+dteJ0KXkubWXBbp1ETS49DdznKW9Optd4/tB
         VYJA==
X-Forwarded-Encrypted: i=1; AHgh+Rop6iGPUW6I/iBxyxOhAX1cfQjpUeHuqEeqSVbRaVlp2/9YQqb9hFtDZ7r77oMBCnPGQSUfv4Ii0HY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQU2ht7pT9j6t3bjImeiikHCPEV4TSRciMx7q5uFfAEqCYa2Lm
	wRk5MkSxHHq0MkIOGdGV8inRCBbXfEXEF4J3yYwM7hcGU08OT+W/prpoaP8Wu55UWusEswtEBr5
	L6O0C9A==
X-Received: from pfbi27-n2.prod.google.com ([2002:a05:6a00:a51b:20b0:848:5395:9a78])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1d87:b0:848:4256:d6ad
 with SMTP id d2e1a72fcca58-84ee48f8ab0mr799329b3a.60.1785528610394; Fri, 31
 Jul 2026 13:10:10 -0700 (PDT)
Date: Fri, 31 Jul 2026 13:09:44 -0700
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <178552799129.2700794.10181439022561913222.b4-ty@google.com>
Subject: Re: [PATCH v6 00/36] Cleaning up the KVM clock mess
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"

On Fri, 03 Jul 2026 22:17:39 +0100, David Woodhouse wrote:
> This is v6 of the series to clean up the KVM clock, rebased onto the
> tip timers/ptp material (the timers-ptp-2026-06-13 merge, which includes
> Thomas's ktime snapshot series and the read_snapshot patches).
> 
> The KVM clock has historically suffered from three problems:
> 
>  1. Imprecision: get_kvmclock_ns() computed the clock from the *host*
>     TSC without applying guest TSC scaling, causing systemic drift from
>     the values the guest computes from its own TSC.
> 
> [...]

Applied patch 1 to kvm-x86 clocks.

[01/36] KVM: x86/xen: Do not corrupt KVM clock in kvm_xen_shared_info_init()
        https://github.com/kvm-x86/linux/commit/3d4b20b5a7df

--
https://github.com/kvm-x86/linux/tree/next
