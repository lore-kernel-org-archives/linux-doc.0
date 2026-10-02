Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1AB2F0661
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 21:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975236; cv=none; b=mUUFHY2OZh74KDXiq0tk5iUdZaNcVxi9sHheSAPtj3IqBE3+dI5T6cn1aWwxTJQFBRskeLk1FzOtejXuV666M0jBBZFwbSD0qJzq8YJ8oVK8agOcWYrQ44PJeou0xkHu8fjNEIefdnvRgkMdpCCRIYsZXuBbM7Rq7LgS8OEGPgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975236; c=relaxed/simple;
	bh=w1W5J3SALBETF+5OrryW1gx85y5dHHK+OV5TMcQ6fLg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uMK8hbX0ZOKO7qbVirJUHOsfZEXYrXs6FI7b4zPWFb/geYir5uxRWdUCLUZyN+omIpDM2t6NXoclhJaPiyjZOW7m+tMQut9/6q/P/6rdYMGTP0jOODN9zxU5OSU7De1NWD3osCmQ6Em2Esbsr3zwErMUOK7fMtnQtt69a/UZMEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z3EEuDkg; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z3EEuDkg"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so396743a91.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 14:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975234; x=1791580034; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+a1MIFjkZveTbvQHiVu876qwYJS4kKndW0rOXlUN/c=;
        b=Z3EEuDkgJ82+ZBKv0yqlrusqvftFFtMEo+RtHjsz/BPMABVajTfOeYgtOTO4ipTdMt
         EZiBGdtVtkKH7ouFioVpRnvdrSOMdGvUGSarPvrd3cAAWD3uIx8+leTjhjqwE8sNiicf
         9QM3irPFGyUW8Ifbg2X/f4/TjEz//2uBWYUkMIFigleUndx4A4hoW8C014iOpfZKZ2f6
         AsaDx7dEsfIHMwBtFncAkUKUhv74q6iRIXkpPqFbkrHSROPxG64iUAV5HAjTSbCqzUpu
         Y36GS1j0zNFLiXqWqF2OxueCZvro02VcYWJbK6OI8U4ulO8n1h+DES7eb3QRo2vBiLFL
         tZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975234; x=1791580034;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+a1MIFjkZveTbvQHiVu876qwYJS4kKndW0rOXlUN/c=;
        b=qTZNgP8AP9D/7+MRbJrJ9Etpg8iiuVLEbwAVDuxMODVm3kU9Rx84VtJPUPJSfEvyId
         EEpZ42RBODBtJ1W5wmzIZ4bplgcqSuwDJ0bVULaNOOOuW3//XYFlOs4XpLtjV9MSOWUX
         5sD98LI7S7KYciuaT9HQ24k4Ieuf87rsbw05U38eXmOdjT8maP9jUhaElI8Ph75cLQrQ
         gY7BKcmis/mzjpS2bOZFCgfZyE9sad9vRkB9W2BWW2qr7Mk7T//UrZw3G9TzkeIbzBHA
         zao1/Qi1Nck4hdOMG0oGxd7yQ1c2hi6bQlFQPnWEWbdgvFYT6ZfUYBgzxKpX8Hutkeob
         jVpQ==
X-Forwarded-Encrypted: i=1; AKwUvByw7xrRX6t2bvjx2JsWSOe14WvLh7UqtpfxjDPxJwrw5ex7TcumWovyPQH4wClE0qYD5Sopm8NUlno=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOvmETXwOMJoQFJVh1N+4sRDof+aAhJgtzZLGGivzZUsI3Qe1c
	wTlwFdWu/iobX6vmCM/tREjkIQSCJd2bmI7ycWWbcI8DFIBI/mtkSSpuHW37QgzeSDV12LoUlBk
	9QgiDVA==
X-Received: from pggi24.prod.google.com ([2002:a63:cd18:0:b0:cc7:924e:a5e0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7d2:b0:3a7:8350:49a2
 with SMTP id 98e67ed59e1d1-3a78350537bmr399081a91.33.1790975234122; Fri, 02
 Oct 2026 14:07:14 -0700 (PDT)
Date: Fri,  2 Oct 2026 14:06:42 -0700
In-Reply-To: <20260928180250.3075584-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928180250.3075584-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179097474286.4070650.8909923019348377018.b4-ty@b4>
Subject: Re: [PATCH] KVM: guest_memfd: Fix the in-place conversion documentation
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, 28 Sep 2026 19:02:50 +0100, Fuad Tabba wrote:
> Commit dcde2f853ff46 ("KVM: guest_memfd: Ensure pages are not in use
> before conversion") added error_offset to struct kvm_memory_attributes2,
> written back on failure, and a -EAGAIN return. The
> KVM_SET_MEMORY_ATTRIBUTES2 section of api.rst still lists the old
> struct, marks it input-only and leaves EAGAIN out of the Errors table.
> It also refers to KVM_CAP_GUEST_MEMFD_MMAP, which had become
> KVM_CAP_GUEST_MEMFD_FLAGS before this ioctl was added.
> 
> [...]

Applied to kvm-x86 coco, thanks!

[1/1] KVM: guest_memfd: Fix the in-place conversion documentation
      https://github.com/kvm-x86/linux/commit/681f3b68f435

--
https://github.com/kvm-x86/linux/tree/next
