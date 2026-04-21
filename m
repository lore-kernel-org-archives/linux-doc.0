Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8843A875F
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779238; cv=none; b=SzRpzqqnjnr9koNONehneLqCDbFxqovVI7rNnqTwul/CUGJuwgSYd4rpWcNZ4170wydEwXolq8EzrD1GHFyXelmhvIWqeoLHBreJTdmZ2wOd869/yhb7gG12vVBhNI/3jhr5CjOqD/RbonufwR0FZud9UgSfQhd6FF1H/C4zTEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779238; c=relaxed/simple;
	bh=cPnsphPvzsrHtnf1o8LVbV3zHViJj9GbATvXL4hU8vs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Taj/vEptFId5WGo4S3BuAQsIH9tL7FS3K7SmaPhjYjnhtL7mnsK9Vf1raVylY2wBJMPjBteMLQvHV9QT/vlqZ7qWOCwprVkVGungKjIalsrgkobzVydVBi3NR+ICvmkSTBSK4xu2SpfJYigWIwi96lH4DjwU9JmBY90dofR4/jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b=vo/UrfbJ; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b="vo/UrfbJ"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-479d5ff103aso951339b6e.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 06:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20251104.gappssmtp.com; s=20251104; t=1776779236; x=1777384036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncZC6vM9FFS1oO5nJct87+zQrMiu09u9moJUQ3KEN4o=;
        b=vo/UrfbJvKLB2plXoOTGIHW8XsWBJ/onm4e3AsV0Jeh6iaIETIG1cG8W06GfzZ/lbH
         50aCIeGvZvniGCR7fMpEz/GdjifxuXxFiPP6gO/bvkNFaER05kO1QcBa7OOMiulcxK0H
         WqCchgvPPUKnx8PbQRiPaWqcCsD8V9BkVeZgSWzvtErowJDBV2JIXpVzTsa/JjWA1/i3
         DJng/kIIVcFeHXhRrxeIVdhV+aRyBEBLapNrTXk6wjvdiyUkD3l6Md9GioPd05dYKmTJ
         NP5vYK0LUhP7dW7FlWpBKKTvA44Hv74FwVOCf006ePfm4yYIyQld5qV0eQk4dRikNkma
         JtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779236; x=1777384036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ncZC6vM9FFS1oO5nJct87+zQrMiu09u9moJUQ3KEN4o=;
        b=Mw4pkOixK07GgAGkcsS90AC7HsnFGlAb17kUdtmUERmsyLafzZV/y0EKcFc6UkCTX7
         ohxrYy/n+tY8s5evYmRALccUvLbDfwsGxXhHNjIuG/N+sCjqVXTZ/QubSzizlvZ8y87K
         22O1b2kqMdpj4ApvgPPQ82HZsFUphbN/QZ43Ll0yeMV5Ykmay7SsU9dIF3149OpwRLhW
         KJ0f5+WFdxTPZRio4+3NTaVOni/pfcZ7MObx7xOGinj3net1T9x9zdoTH1GHKACx+ng1
         9MTn0OGgklt0sfUKnG4MNGY6Yxz/ct8Qw8183wQqURMvTzy8kyBra5ASYzBUcvUb3V13
         4FnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nyk/HT7Nw7Eu5ZAAAJTDgBeQqgmWnPXL3i3SmR5K59h928P+m0npROrO2Z0ZmborXhkuUIPlZvWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEvTZOH31eyeQvj459biK6Jg1Zpj2iDBUxNHSLsWClugcHpisS
	5Iwn9GQHl8YxjqP+/14oi1Bkv4r5iQSnyd3k8R7eJipM3G6UY3ZqxRtmZIMoAyRsUAw=
X-Gm-Gg: AeBDieuwX+2T6rGa7Hl8Yn3Et+U4KpFM23Iff1CFhaTg8if1ZGrbKpP4fHEB3ywSEfE
	j1Qp+J6JrWUlriCTEdeR0Ly8Z469UCnN6KHp8lWBbPiahnMliB4qfN6r202jz+XmjY8WPuVf3pf
	AeBz3q7Mj2aKG/4D+v34p1d2SCh3J80Nkv0yZMIrkGgBJmgtbj71+2sqxVbbd13M3mo8Ls0KRIL
	vKzROn9m5WUI4kUrbj3jQwb929focYdaYTEF6cc6LI48S5GJr1bTd2J4DllZp8zhT0ELCj6xZga
	riC2KlS44nga6J64JhuPVHLs7jmPWZm7TZeMJz6cb2a/N9TUACAi4ydeN6DVyCv8ZQxfBjuXbta
	nSin/fbSBc/dQO/9yNs7TvZvXMkBj6gt/k1TNNeVbE75akZJn0gJC9ae3xj27Z3X2m/zZyY5KKi
	o7tm78QqOWeEL7w2ABNB3c9uptMxnvNOpRc7ubEUVOvesAeQ==
X-Received: by 2002:a05:6808:1a06:b0:463:ab56:9ec5 with SMTP id 5614622812f47-4799c8f3109mr9384478b6e.16.1776779236082;
        Tue, 21 Apr 2026 06:47:16 -0700 (PDT)
Received: from phoenix.local ([104.202.41.210])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4799feaabf2sm8808115b6e.4.2026.04.21.06.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:47:15 -0700 (PDT)
Date: Tue, 21 Apr 2026 06:47:11 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 mchehab+huawei@kernel.org, jani.nikula@intel.com,
 gregkh@linuxfoundation.org, demarchi@kernel.org, rdunlap@infradead.org,
 justonli@chromium.org, ivecera@redhat.com, jonathan.cameron@huawei.com,
 kees@kernel.org, marco.crivellari@suse.com, ferr.lambarginio@gmail.com,
 nihaal@cse.iitm.ac.in, mingo@kernel.org, tglx@kernel.org,
 linmq006@gmail.com, linux-doc@vger.kernel.org,
 linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH net-deletions] net: remove ISDN subsystem and Bluetooth
 CMTP
Message-ID: <20260421064711.04e3e71a@phoenix.local>
In-Reply-To: <20260421022108.1299678-1-kuba@kernel.org>
References: <20260421022108.1299678-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Apr 2026 19:21:07 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> Remove the ISDN (mISDN, CAPI) subsystem and Bluetooth CMTP protocol
> from the kernel tree.
> 
> ISDN is a pretty old technology and it's unclear whether anyone still
> uses it. I went over the last few years of git history and all the
> commits are either tree-wide conversions or syzbot/static analyzer
> fixes.
> 
> When we discussed removal in the past IIRC there were some concerns
> about ISDN still being used in parts of Germany. Unfortunately, the
> code base is quite old, none of the current maintainers are familiar
> with it and AI tools will have a field day finding bugs here.
> 
> Delete this code and preserve it in an out-of-tree repository
> for any remaining users:
> https://github.com/linux-netdev/mod-orphan
> 
> UAPI constants AF_ISDN/PF_ISDN and the SELinux isdn_socket class
> are preserved for ABI stability, but the rest of uAPI is removed.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

Acked-by: Stephen Hemminger <stephen@networkplumber.org>

Will remove it from iproute2-next as well
