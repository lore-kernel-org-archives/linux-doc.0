Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A080B261B9D
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 16:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760978041; cv=none; b=d4rHpGlXrU9lTPL4Abl6s+kkErFMmVR5Sc25ULEbPWKyl44EpHMS6jWUzI9LIa4SFW/H/477x4a6WQYm+WXYL9Ht5VjpRrBLVcUzFbBGrhKX+dN7sszTx7PhGEMsGYEK+06TaD6QqleYCFlgQ+NKxnQUCcERTF0owsoQr7c9rl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760978041; c=relaxed/simple;
	bh=Y5CEGs0t9LeXRLRCfmnRV+V4yK09SUomkNMkTtKhZbE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YAgiumOmeF59BGY9njpDwug6R9KwX0ijwxfA//dgUsiT8J0T4qPvmRG0Ri145h2XYNeb+ed68+dUGajj2MHMwfxmJca833enIOVDxIQL2/2g3eTEgcGmBXGJ+0su4B7ZzC4JNjNZt/Q+f/d1RkptOT2D0hUjOT17N2fCLspdyZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZZzZ1aWf; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZZzZ1aWf"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b5535902495so2619126a12.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760978039; x=1761582839; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xahSst9CglR2qFJe71Is8QVBM1v0GjyVtyRULSD/218=;
        b=ZZzZ1aWf/BGewykJ8Q9qUGbrPQukcfrZt0B02Oi8ff+QqNUVMJQjYsyy2eLUcNCzQ8
         5HUHH6CiSmyRtZ4EDVYXBa8dFjApSUowuVUgYXjV5bacbe9dO9RyDPv+JF9nclfLqqpt
         IdfMppAP9uIeK6GMJU96xuSsTC2AeCDaNma4X96UKPETy6Eo64osK422sR8SRSNNpf4o
         Wyc6s1n8stoxlJWqlLQqkgniG8OkK33jVGq5LqE58beJO83LfvVx9gUmnwB/GKNMBo2t
         yOXseyiy1R7ee9Ng53rEj6jUciJoh6UWzoj6MbOaz7+/qxUoVKU52BrbMv6wW0qmSAzn
         LY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760978039; x=1761582839;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xahSst9CglR2qFJe71Is8QVBM1v0GjyVtyRULSD/218=;
        b=UzhZu9PZkNqn3sFRVK8NYBPCJQnD4GBUvJ2wbV0t4bEMZAWS+scPuFKvyQj/z2rhht
         NuVB7MFmxWhjhgpyObtvxXIZhID56DuVSvtkUmjJH0wyfVwGeMYCTP0NF46QSj+dxO3W
         1gA4uDf5XupsaxhOLoBq0i3JcxKAkwvs7ozU+Ha3POGsMN1pzuYm80nNlybhrIKMtHt2
         UH4VWvyYJ+jTxKWVKje7Cbjd09HLfqbjQQKlOvfar6paIu/PXMt0hbgmd+555kHRDXf0
         TuiGUxBzvZG2MpCDdMLNVWWJwOO1wFvFyx77dydbPV+CACQu9YeOJz7GjoRnW88jU4fS
         YXSg==
X-Forwarded-Encrypted: i=1; AJvYcCXE/KoePdjykY8MDQGCQCHXga8bX0YB/VT4QBH0SG76tvc3hP30RZCc5cfrwqpgvt7UvAfAehLE3as=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhhxtsIjzjdejD7d6vTo0CcVi86vjGLGysn2j+BXOa9/ILhEov
	K5Gt1LAfLYXvSZX5l9PvNrLjmDY+gud6XOZ/NhILUnqR5flQnqbRXy5nHb/jv5qEVtWiBmS6X6z
	t8H6OIA==
X-Google-Smtp-Source: AGHT+IGz3l2nSx5AlR6WsV3KMbX/iOTStifDphqigGBgItnK5hyzgl82eH4fn8NCfPXntYDzW0XJZScJ2gU=
X-Received: from pjbgk9.prod.google.com ([2002:a17:90b:1189:b0:339:ee99:5e9b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db09:b0:290:a3ba:1a8a
 with SMTP id d9443c01a7336-290ccac6d3cmr177014055ad.53.1760978038920; Mon, 20
 Oct 2025 09:33:58 -0700 (PDT)
Date: Mon, 20 Oct 2025 09:33:01 -0700
In-Reply-To: <20251014152802.13563-1-leo.bras@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251014152802.13563-1-leo.bras@arm.com>
X-Mailer: git-send-email 2.51.0.869.ge66316f041-goog
Message-ID: <176097609826.440019.16093756252971850484.b4-ty@google.com>
Subject: Re: [PATCH 1/1] doc/kvm/api: Fix VM exit code for full dirty ring
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Leonardo Bras <leo.bras@arm.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 14 Oct 2025 16:28:02 +0100, Leonardo Bras wrote:
> While reading the documentation, I saw a exit code I could not grep for, to
> figure out it has a slightly different name.
> 
> Fix that name in documentation so it points to the right exit code.

Applied to kvm-x86 generic, with a massaged shortlog.  Thanks!

[1/1] KVM: Fix VM exit code for full dirty ring in API documentation
      https://github.com/kvm-x86/linux/commit/04fd067b770d

--
https://github.com/kvm-x86/linux/tree/next
