Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EA747143B
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814285; cv=pass; b=bEXljEOQ3jKrI3Paa+gbrZToi2P5pM+44Hh9J21giX1UExiJt1wwZQwg0S57B5b98PGkheGKx03ytxjA3sH1C/7dcv74me3wVa+GvhQUMVHdpXZ37UfOOvmJR2b11btubo5bQCldZevXXFKn6Z0j1n8byC2HhV/n0f818mjJ4l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814285; c=relaxed/simple;
	bh=toTfP3XAamHR53tLn5nTeuCeveBATzueww87oO23fhc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RA1YH2BvEaYfR367wZD0k6m1kGF8jpwCoTRW0K65ypI+oh4aXxn9/jDbMHzZqO23scfbWchpQk39ct4eGJoD2FectqSwYxS/WPQIYjlF5E5DQDq23p7oCD4OgR4OtIo+7WJiwrAd1w40xE4+BF7v7YSbENdda1pQlGCoJ/u3Y3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kgyuT6Gh; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kgyuT6Gh"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91986c5cb75so26065886d6.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 07:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814282; cv=none;
        d=google.com; s=arc-20260327;
        b=nP2cl91CvsPbDfd4R70mTmZxe2p6ZBlAM/oldNxqGquaesssV5hOOGzJKcrHEW19eV
         yX/7VO0CrghcN8iEUTdhHQEljcd6Ma/BN1j/tLXJQceJQWwOY3EAocEcSBVr0lxUNFuW
         bHoJRgJYFtkphE6SyT2KAft3grpgoUiDREb9arFf5RA2c2KOLK7tDaeEd3wVm/E53jsm
         pCs5Ul8AQdQMfJSTyFv+csOq951bUFzHw8a+6dj+RnGY5SwtKm13eYzTBKx7VYqje2cP
         EYzNxUlclL/L305no0eb0GIx8v9hGptludrAhHshREsWoowi2Ec1GZqQ2jA9jr0HPkgz
         b8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=K2I843zxPr9lME1nSEmz+NsS/OxECT+sAh7A1cwprg8=;
        fh=WDGguqbPI9lGu2TA0qjgllwJqWYtJ4yy2qkRpWthiX8=;
        b=QX7D/TL5FttjV95K70FWQ0EZZIc7cRnO1O3aOgvxzw7Jf3eVRi5Yiq/kCTcCxQNhRt
         0ZZarYmrvqH3HAlP8BQ48vkEDEZkYFwtduWeM5BTpx+BQsOtLIVGI+MegIifJbhm6sQ4
         itMJ6NXU3asRqtnuH3WmkDA8rvFCzBbAPLk8f9PCflzQJpz67/3Xezs+2I+PKbD7dPcT
         XCzvWVXynQS1IzIrq+qzL686rE+wlkLAlGYCsH/G7+6iwbqfsrub0npKGr88ZBYKVafx
         JkvUBOdiQbsw0jyxFDiBoaCRV/yTO78QgqYEQUbdORUn9+fv/XPwduPYYqKEwlWvW73v
         HgyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791814282; x=1792419082; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2I843zxPr9lME1nSEmz+NsS/OxECT+sAh7A1cwprg8=;
        b=kgyuT6GhZP2e9wAIVNjBLLQdg7WYJCEfwbZZ3pzwwtudHTwoLBIyGS+t/Ea+YoLBHh
         aE6CtqGG7HQYO3Uy7dxQ/4sQvYXQKUj1ifbxHbc5a4FfQZCqn5m6vHsdo/42whasPFwm
         E7tTJQ+yiDRxegK8OB81+eSKEsiPjv2Ik88d5AnBWv6H8U0R538hFDu3FdAAIrpxV1oU
         8CVw7KQmqAACDvBycdq2u7goeOC0KA3UG3VSI54VqzgDThMEX6r3tIX9JhC7DFYIoAPV
         S4Qj1EWvR2qDDLHQbOJh1wvaQsNgj+8l+ps8XX0sZcLcPWRoEXBzSuM3XTW8j+fmmU0D
         haPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814282; x=1792419082;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2I843zxPr9lME1nSEmz+NsS/OxECT+sAh7A1cwprg8=;
        b=b8FPXVsiPSZwlYRkzPM2v0pO04PvNyQBlLiTuAitVs7n3+SVrb8usrRnrvcd7RupZU
         GZSfbhBwvafFURZnjP1f+yE++9W3t1Xzy9wqMV9AgtlHw5A5jk48O4a0i/VRp70eL4SH
         5htXnG3LS1OU/lSdoQ3Bo4Fk5V6XB5e5trGY8orZJm6u4uMmSnuD6cZ3e8eYHDGVhLth
         shA1jJuGmnivqI3Axz4FmD9Sw+AVfUFDRbH7SvHapsMr3IGnS0HtzQxEMK/G0bncPhMs
         FA6zFD83KSzYXjxE23SYxf5zLRPvlHPhVA8AOLzAoveATbeTZzcHISUnGldJ1Eb6KtTO
         5nRw==
X-Forwarded-Encrypted: i=1; AKwUvBwvAs74CVbyq5eXs3yLe37R82iogsfERl8xCe2g71QTfIG8XSrY7vESAgxNqja8euCDOG+qniPMAro=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh8lCOy8Hukvh0vBxcU3VpBGeUb62XJtvPw1CooCQSq4qKR25O
	Kgvk7zGIaqJ91jiwTo8chFN4eWDek00EiR94TejwmpJmzS1LQEPVgD4fgcD3HPuImC4wZG3LoAG
	fFzaC034VO6H340Sp+xWquGr4PiJQxlpSf6uqtbPu
X-Gm-Gg: AYBFou2UYbnzjEY9NCxeXDDDzQa2xxVmoplXVyO053G/QEtY9sKBvElieBYLyZ9OchN
	+OSp5bCCOiDwPj7frrax/j9og0WLROVQR0hWonA6Lm6v5qaoC74AMeGlIwE+DC9Se7HYFZdY9Ip
	l/9UAKE8rnjAVVWNrRkQCQ2LzRnr3I4ILqlYgp+qxlXZLOJBLZz7J6U6uhqFxDN3rfUcCPkfPpO
	ZUAHFDQ7V88yl/GmaNBZUI1PFNdS/K1Zqhagp5MFaFpI6PT/8cY0xR31NBBhcZ8QNbxTbrI+tGn
	vy2pM0ILVX/7+cT3YlrUTJPeTfQXjDkzHuue+3eKokcJFvPh5RztO2LsmGmKAs5iM9jZAA8eioE
	A6Z39gc3U9soCoitjaKbS
X-Received: by 2002:a05:6214:23ca:b0:91b:8e83:e4b0 with SMTP id
 6a1803df08f44-91b8e83f3b3mr19792736d6.20.1791814281518; Mon, 12 Oct 2026
 07:11:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Oct 2026 07:11:20 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Oct 2026 07:11:20 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ar5iaaLcyz9dCXQI@gourry-fedora-PF4VCD3F>
References: <20260925-gmem-tmpfs-backend-v1-0-d36159822d18@google.com> <ar5iaaLcyz9dCXQI@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 12 Oct 2026 07:11:20 -0700
X-Gm-Features: AclHuK-GAlH1JSAYNCIS06aJZxJfvunIjbH1E5FXsRqa5lYNWWJsyEqAXZVZwzo
Message-ID: <CAEvNRgFO5FUFwU2GEEbHogLmT+SXVu1asLe5uzvRte2jqXthUg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/17] Allow guest_memfd to be created using a
 resource (pool) fd
To: Gregory Price <gourry@gourry.net>
Cc: Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, vannapurve@google.com, erdemaktas@google.com, 
	jxgao@google.com, rientjes@google.com, fvdl@google.com, jthoughton@google.com, 
	tarunsahu@google.com, pratyush@kernel.org, fuad.tabba@linux.dev, 
	David Woodhouse <dwmw2@infradead.org>, yan.y.zhao@intel.com, michael.roth@amd.com, 
	suzuki.poulose@arm.com, Christian Brauner <brauner@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolin Chen <nicolinc@nvidia.com>, Xu Yilun <yilun.xu@linux.intel.com>, aik@amd.com, 
	aneesh.kumar@kernel.org, Vlastimil Babka <vbabka@kernel.org>, kernel-team@android.com, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Gregory Price <gourry@gourry.net> writes:

> On Fri, Sep 25, 2026 at 05:50:47PM -0700, Ackerley Tng wrote:
>> + e.g. for tmpfs,
>>     + Use mount page size.
>>     + Respect mount size limits.
>>     + Use guest_memfd mpol and fall back to mount mpol.
>>         + Gregory, now you can set mpol upfront on a mount! [3])
>
> I haven't had time to quite give this the read it deserves yet (have
> been traveling this past week), but I think this mpol/mount issue can
> be solved with a new dax driver (which maybe provides this provider
> interface) without needing to involve numa policy at all.
>
> Essentially
>
> fd = open("/dev/cxl_dev", ...); /* backed by anondax driver */
>
> then later when a fault on that fd happens, the driver provides an
> anon-memory allocation that explicitly requests the node associated
> with that device - as opposed to trying to jam this into mempolicy.
>
> If you're planning to be at LPC, happy to discuss this in person, but I
> think this provider pattern is likely much cleaner without mempolicy at
> all if you can just make the provider do that allocation path for you.
>

Nice meeting you at LPC :)

I agree with you, I don't mean to require some kind of mempolicy setup
for every provider.

IIUC you're saying the entire /dev/cxl_dev is some fixed NUMA node, any
allocations from /dev/cxl_dev is from that NUMA node?

In that case, if /dev/cxl_dev is used with guest_memfd, guest_memfd's
configured mpol, as in kvm_gmem_set_policy [1], just can't apply
then. /dev/cxl_dev fully controls where the memory is allocated.

On traditional mounts like HugeTLBfs or tmpfs mounts where the mount
config supports mpol definitions, we first apply guest_memfd's
configured mpol, and fallback to the mount's policy if there was no
configured mpol for guest_memfd.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/virt/kvm/guest_memfd.c#n400

> ~Gregory
