Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577851;
	b=mf+0JkRsvdUDylIvYDe4kJIFvRbAEP1mTS9FolqLAr4F+T+U7vB75p1Gr7PeNK9gamAb
	 P0Hdhoo9GZ7w3zdk4glbhuasVyjIfg4tGRHnlMeS3+U3KzNh6znwig/Wocft1T/2rAAR7
	 ZIfZPUQLR/m5tt11LQ5DEGdNAR5M7CvxeUt6FKpJXOn+nUHl45Ok+9ijk+Lpl3MZRYF6I
	 hIcE+aoRhY/CQPqLTW3M3G/yBC/eU15NGKN5tFoOAQUZLzNzhk6ICoOkaaGeBzpIaH0bi
	 KCxws4reanvj42jfJ2jFglJQxRK1PFhRIjgjZcM8hIu7SozXogRI9BsvnFIUi6e0jlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VsgiRDhCW6kUOuC4NPdpStyHzvYs15vX/Q4TGFl8uM8=;
	b=TesqFBgoQLlM7lYZFcGX1WfSd5Iw8kpcBdxla/kTDDj2Zk0ZzH0l0W1QLsZx6CgL+Xjg
	 mj8GyknwSfkFayHOPuwGg1JQtsSHFcI1mugyfN2Fi/KQ0z1CLnhI5S9E2a7i0SGA3nMnQ
	 Jr79gwYSQiOuIWHoazr2S/bTiut6o6mlm0O+K80/tZYd2W2dO/ANuowm8zVsWid5+YpEC
	 ha4+JUmL6wQ32ZZ4Z5Yd1V+I6n4dyJsXtiReSSSEDCnWUGJ7fTBHOFFYMz1e/RhkH/bLe
	 8x2n+CLdpVO+l8vJIxXKb03e6MYr3krpAdCCH1k5DqE0IVWosjBvinWz1k05UF8zMCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="As1/gTaC";
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A987C606A8AA
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 13:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A987C606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=As1/gTaC
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0f667a666so1366039a91.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 05:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577850; x=1795182650; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsgiRDhCW6kUOuC4NPdpStyHzvYs15vX/Q4TGFl8uM8=;
        b=As1/gTaCGV3WndjdCd4UVwjENbxbsrV2cHNKAd00yDrAI67AHKkq1V3cLPHpvj6Yuh
         lRMLM6kCUTmwjyHbKqeJ8tF0tAEjOVO+GOhiLIKffMLpqbfyRaxZITOJYfwAm4+wN4M3
         tkccJMqGQrJqOsbFi/59m/h9+H7mkIpxkjlCSNjXUljuXtVfh3DKP9U6hfCHPm6pcWj8
         M4yqsKLcpN/oEhSD5tG3g+gtdtn+0R8PTI/aLVR9hoQk8d0tXHuzWGrJBLPFk/A3ijbS
         nIhiamkiRukB6+dZauKmvJ9YqI4pqFGTqReinFfLJ7u8ficwkYqdUduyeMWl4DgLRsjh
         4ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577850; x=1795182650;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsgiRDhCW6kUOuC4NPdpStyHzvYs15vX/Q4TGFl8uM8=;
        b=csbGwIHRG+MMWf30UZaSgAkKKxaG27l2R+FX8B8gOPtFyT21sTGRWilfKdqYOawTo4
         3VyPTKcXoz5u4HW/vMVFgw7tnruJzYskIz16xpKcDnkH3ZhqMWHob01kZd+OId4V+L+v
         bFozH6PbJOccKi4ksjR+jNog6/IBCtbHaNWFLmw0q4WfMoP4XWbij8uatj1O/LGbkQ3b
         TrIVJsuV6iV9BzB6RUJ6gPlZGpPrfPuVxUg6opb+XVmGrK2jWo5OlsgmY+WzzXTCqE+u
         KbKCmP2519WxE7iQpmutJ7PHqDmkyB/wkjoOrw+Tg2y7Mr3sBJCiB34BwHH6aQ25Yh7y
         2b6w==
X-Forwarded-Encrypted: i=1; AL+hErHh6VuYFvBwzyXJfN1BllQ5NnK0pQMZE3hxXv4X7jdpq/Ixi1Ct1l+/2oXEoY3DeKmP7gYwLInf0mA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9vHmtGfQxw0Ui6bk83JiAwWJrgNiU6OzT91QXbKP4foYWglOw
	ki5yuXf4rdq29uTnt/zLpxITrYBuME/YoPa76YUM5lpSkRrFQ/lJdJk8ovYslJK9LBg27s1lLJA
	izwAEHA==
X-Received: from pjbov12.prod.google.com ([2002:a17:90b:258c:b0:3b0:ac19:f886])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:48ce:b0:3ae:5572:c4e2
 with SMTP id 98e67ed59e1d1-3b1b0a4e8aemr2306804a91.57.1794577849633; Fri, 13
 Nov 2026 05:50:49 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:02 -0800
In-Reply-To: <20261008095935.1237325-1-shivansh.dhiman@amd.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261008095935.1237325-1-shivansh.dhiman@amd.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441836288.82026.13479268434351715518.b4-ty@b4>
Subject: Re: [PATCH] Documentation: KVM: x86: Update nested live migration
 status on AMD
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, 
	Shivansh Dhiman <shivansh.dhiman@amd.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, nikunj.dadhania@amd.com
Content-Type: text/plain; charset="utf-8"

On Thu, 08 Oct 2026 09:59:35 +0000, Shivansh Dhiman wrote:
> The "Live migration with nested KVM" section is stale for AMD systems
> and needs an update.  Migrating an SVM L1 guest with a live L2 guest in
> it works, and has been tested with Linux 7.2 and QEMU 11.1.0.  So,
> replace the AMD-specific caveats accordingly.

Applied to kvm-x86 misc, thanks!

[1/1] Documentation: KVM: x86: Update nested live migration status on AMD
      https://github.com/kvm-x86/linux/commit/a9dfce9b3fae

--
https://github.com/kvm-x86/linux/tree/next
