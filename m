Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376813;
	b=ev70dNbyKySSnAHE5utxK1iGbwhMRS39f0IWfc+HuTkCpiu9WTWy9q8SdKo+J+CnzJJh
	 Feb1lOP936fCk3zRe0b7134Xv0W1SEY4ISORrZkC7rmpAMTR5KvVcddgRjroiCXCqBEc/
	 2dfCQh+H9Dx6GeXJ0+NQVW35eE/+HrdXOnvwpXi9Js3VhM5T0kT6qofIHJTS4IXzm5qkN
	 wQZOAlp3McYtvxh+0bxy0XFhCdM8JQDiHyVaNya242StmvkmU3RFJt/VTnnkespZxKghw
	 Dh4mC/4Uduz0vuvIf7KgrhUhiJMVQ93TOwhP83Sq9HXGc/0DNyENlLB3054PMeTJo1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376813;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Op/9/DpgcKIe0jcvYLiJPNqXkkmx6XxpHhTMkcCwGrc=;
	b=JGZUmFXregYmns/cNulNN6f6pmrSgEda3+oEV1iNd5ukVN0bn5yBf8IPswAsHJ37kl/K
	 0dX6ICHf/ZxBV91IuPVfsNK0pPBFeKa7z0Vln5aT6L7XhouHpWAGq7K86KpzfmcgL8QcW
	 wTkap4tIwUJvgmiS6wmz/+jJ8AXOUHP7iAs/3C2B39k5cyFnkzyuwZpiAtxlPxlA5X9Ny
	 QBptrWEcm3mfRhrd/mTQucbEZG7iKw8qbSrUNHFpQHavHMaAfzco61Oe0eDyZ0trzvrJG
	 im+k3PwNlrbcZHzJaLAJGumRozKlWZog3XVTB7UBtGjveKJuF/KRawrTjRWTt+0HMyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZjFvApRI;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2236960A2633
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 06:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2236960A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZjFvApRI
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so1753963a91.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376812; x=1794981612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Op/9/DpgcKIe0jcvYLiJPNqXkkmx6XxpHhTMkcCwGrc=;
        b=GNyETT5Gsc6B4y2Xxm18lHEytZ3mMDvFIAnmisQs/9hDofLgZABEmSd6N14hgc92Wf
         sMjm6q/8qmimwAqyk3Bamdth83Co6eQvweEtngYmoCvQ4k6DV74ZXGbSsbF/dMBFzSSe
         euwdr8LXjN/0I+skE/uVRfMZPCrlXcNeIyZPk8ztdru0Ya+cwx32WbKobNULYP37Twtv
         Z2bsjA2SEvrML639Gk07ifaeGgIb55BdbpRvKIv9QWJ6vaE7SPx+b/oiWS5P090KcGdz
         kmS/fNXN60tCrxUKPM5ZT8K7YZ9yQHB5UcPOpIGGDBSEbrCf3rTkSQZkjiUJ4S4fGYQc
         D/ZA==
X-Forwarded-Encrypted: i=1; AL+hErEdu2lhhntUWmRgVlCmB+p0Iu5vMwwMvSeOPMg2p/fEnPb968xQZK2yC9dm1hodK2vURawLr80TN5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OgVbASFGIyGOqetPeuKzmeakCQNHRWfTliZM3eFHSNqUC0EdA
	deQDHoU/1yGNB0zo3akFsZx+C4NdRH0lLIJpepbAhlwpZAOgsAK84aUOj/rr7xcEo4d1xaHzjON
	nJIrSHwWBQiIqJ6EcxBeijGdAMVQNzMd9TVjIgXDxBKLT/9h9/skiWziMOTuKwrVoyMBjYfvPvb
	JbrcvZ010ASdUjUTiC68twYv1oLm2nwv4a4bMPOK/Nhfhx/Nl6NnhTnWu6z/cY75W+vi5BvB5K8
	UgEvhGRq9IB
X-Gm-Gg: AYBFou1ccP5/FDAYqXIALQP11CSS9+TEBfPXHPJPAPCAfUWmt8hwQ8EUMgrGywnM8UY
	Ek/05b+wHmwT0wXtjyp6MLbtQF7UidFfvcvGXZhe+oT3wtEZlZfAWvu/MDK7PBWsd6HhVIwDSc3
	03o4K7HcoOClNtZIGCkDe45Td8KT+OAzOASGBgC19n17WIQ0XpZVOwySEKUzGW6oaJygfjNOR00
	/vnR7mGNLr5TyBFtd0Ut0j6vtgbdlNvqWLLOU4XpVqo8MmLNBeZ0wbtD01vaLeTv+MAtBSVP3Hv
	iuu+1jeWqRNT/60nbBQ1B8OoCQhppoMJPHuTdbvnnaaAtU+6V1PiqHrSdbChx0QeqV7WuqC4PP5
	S2O2LsxACJhRL2+7I0IUJszNhQW1FhvsYj6gmefpIpZHwmYgT/h1BCLXclkuh7yOdDasDodCN1T
	brv7JAOzKwOZeD2e1+3ONkchJRU348MXvE
X-Received: by 2002:a17:90b:3901:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3b182f660ddmr1361667a91.20.1794376812093;
        Tue, 10 Nov 2026 22:00:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17de30a7csm1359809a91.1.2026.11.10.22.00.07
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:00:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f62934ef6so651049185a.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794376807; x=1794981607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Op/9/DpgcKIe0jcvYLiJPNqXkkmx6XxpHhTMkcCwGrc=;
        b=ZjFvApRIFsh5X67BEGnT6S/tCiy4gMnxOiTiBifW6Drt+KGNJIneE5/tzwMbbqtCaI
         wWn/hwbp5ViDEJsqFOytKVMZJF4tQsgDlD81YvXuiLTVio1CuU3HnOXlzvqLWikXEJ58
         EQa5SyazNYqU9R5FDBYimR48SIikcfIev0Xto=
X-Forwarded-Encrypted: i=1; AL+hErEJZsuvo7OWp1rlLTqiYPQPLTI3kaxFd9OgrBDie4I28fdX89qy2qrzuxI7jX5yS1aP6HFNUPd1j+w=@vger.kernel.org
X-Received: by 2002:a05:620a:29c8:b0:93c:720c:94e0 with SMTP id af79cd13be357-947b001c6afmr209719585a.30.1794376806974;
        Tue, 10 Nov 2026 22:00:06 -0800 (PST)
X-Received: by 2002:a05:620a:29c8:b0:93c:720c:94e0 with SMTP id af79cd13be357-947b001c6afmr209716085a.30.1794376806575;
        Tue, 10 Nov 2026 22:00:06 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:05 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Doug Covelli <doug.covelli@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Xin Li <xin@zytor.com>,
	Francesco Lavra <flavra@baylibre.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Liran Alon <liran.alon@oracle.com>,
	Arbel Moshe <arbel.moshe@oracle.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 01/12] KVM: x86/pmu: Honor enable_vmware_backdoor for VMware pseudo-PMCs
Date: Wed, 11 Nov 2026 00:59:50 -0500
Message-ID: <e08e3b6d0a8dcd25f1ee3e97a64acc1cbd3c0f1d.1794374897.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794374897.git.zack.rusin@broadcom.com>
References: <cover.1794374897.git.zack.rusin@broadcom.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Check enable_vmware_backdoor before kvm_pmu_rdpmc() hands an RDPMC of a
VMware pseudo-PMC to the VMware emulation.

The pseudo-PMCs are part of the VMware backdoor, but only the
emulator's check for RDPMC at CPL3 with CR4.PCE clear honors
enable_vmware_backdoor.  An RDPMC that KVM intercepts at CPL0, or at
CPL3 with CR4.PCE set, returns the host TSC or time to any guest, even
with the backdoor disabled.  Inject #GP instead, as for any other
invalid PMC index.

Fixes: 2d7921c499af ("KVM: x86: Add support for VMware backdoor Pseudo-PMCs")
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/kvm/pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index eef2f792dc9e..ca6dfb44949f 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -759,7 +759,7 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned idx, u64 *data)
 	if (!pmu->version)
 		return 1;
 
-	if (is_vmware_backdoor_pmc(idx))
+	if (enable_vmware_backdoor && is_vmware_backdoor_pmc(idx))
 		return kvm_pmu_rdpmc_vmware(vcpu, idx, data);
 
 	pmc = kvm_pmu_call(rdpmc_ecx_to_pmc)(vcpu, idx, &mask);
-- 
2.53.0

