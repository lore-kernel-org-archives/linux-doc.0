Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFD347ECDE
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787318836; cv=none; b=KUu7PYs8wzD5VpnXQpfP0uevnsF+8cSM9ykVvDfnV4RvQTySSquTM9e26oW/W2Mf1JD+fGoC1jHii6Znm2rtGc4zXaep0VPbD7zeVTkTr2s74k1BiY6QvVwaNyYgENtGJvSYoofvtXTZw1fWoHz/kyiHdjGmuOAaPQB24wMxuYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787318836; c=relaxed/simple;
	bh=5klepE7p4Hg1qEAbCF6RZZu8Pu13Alz4PVZPELP3bS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XUXFFrL3+AAFNxKTrRIEcar9dJZRWRH3abevSZB+aofDuT6+N5P/9TrgVjXQb5GmpL3A/zR2XsCi86fDamMFd83qeMc1ktkL/WaPNXtole1VIAk6fUbn6RtNjLOWhHJVX4VyGh9YbhXagAPq+N3HpR8PXISD/fqR4Dh7Km65q+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uuvg/Hmf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uuvg/Hmf"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fecbbafdaso348574f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 06:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787318830; x=1787923630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93TKIYVELb3f7XMDYi0bAF+lcotYrliPfpYhNsdjWuM=;
        b=Uuvg/HmfdhudG2I4OkIcuqi0ihof2HdqZeKDbGqe4K7rtcg/jZuIV+5wtYUtm0VrSH
         Few3nfouzm529EJIoWKAZkfHTZqnlZMbKqV/0+rsqABiJzOoVNqBeLXHgmY86Hint+xo
         aRcqJVH2GGtDgvuKIo0xtdXWOM6rA6CBJ+JSOPugVTPwXrXN8CwNstu7nCpwr/O83XcM
         XMdTD5c4+ruoXBOHgQeS+DZ14vYPUBia9mBAlPrrdJjoWtkbbeuwnU+GbMFukPsoOE/h
         WElOgELVgPVCokpRqEMCO7y9F1QUYCx8hHaSyNvmDeu7WNquADXA3oF0H9canxnKrYeT
         QDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787318830; x=1787923630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93TKIYVELb3f7XMDYi0bAF+lcotYrliPfpYhNsdjWuM=;
        b=ms2+G+6+qbDGkQKqJsEwWuBxh76alwOh11gdH91KIt3Y7EKZCujedecoU/YCCeND+b
         F0jtyUmwfSsK2OZWHbhJ3W1IqIUsJNsNRAwG3tWlYkuQm7wi4NfYHFCwxqFOeT3TgVut
         wk93pYSrmXYfZWH8XZFI1XHKnxeWlzc82XoPmmWSM8Hy2CqQWRe4LtqSydqtrqqy8eZA
         iF+NoljdzR8+bRK1RCkh4ygu+g1Krfi+QXjzK32UTnpwPTZDPWUQKgjrH0DFFd+mxgXI
         FW5D/oWtCC6ZvGKSQXenn4l2L4sFHvzAxRYp/v+Y5+UrNc/EBzIqRNjrM2o9yGz0uXmv
         nmKw==
X-Forwarded-Encrypted: i=1; AHgh+RrGrf2oUwdWkJL4Oq6KdS6gisz34eEMJdXXOb7cq2ENUmRlkMyBfDSVu1UWZ7zQBvpzN891RKG9lL8=@vger.kernel.org
X-Gm-Message-State: AFuF++lh4nitJmcn2pf7OYoypEvTS4eY/rgN7OyevYFIRvCL1WzygvHR
	l5AkJkdbpgY8G74rADoxcmjWNS64k1S+A/LIUFg/Z5CaoihrGLP/l+2b
X-Gm-Gg: AR+sD11chhxae4lzv6KfV0E1xZVdIOOrNyBBZSypGwNlWXHyAB/dafb+OavI2Gs0686
	4tctxQXrQnEVyTuh1tYyBoTi1aVLvfXqyxZvh09hI8ArGJvXELmMCFn3ihVJL35oG3G+NZnzqhx
	Xb6S4eYUxG0pOqTunePSfmF5YwWgKS6K6iinWCJwDndUO1dNIu4+fdehvAXiUWo3876zX6FIvY2
	XC4c8V8tD1VgaeJu3KQfkDBUlbrR20/VkaIdnShUWmSJVumMndJHfdMJ15e5O+jlYxGnH+/RW1Z
	If3RqXazmA/8i7gxzHUTwbmII8vFS8zzSYfv6f6DYED5//A6tUE7pGzJNSsgE0+UZunh44QMFNe
	ghWmPdrh5pUK2fLRF7glNezCEcZBRNlLbAUkjwaakS3BM3JuKQKX44esOTCr0FnsnGh+lc2ut1w
	wCKpca8HRI5pQtYpD4hn89kUTukYgQ5qKw7qHQCy27PPtcWJcl+jE2rbVOA04s0PvyH6svlgD4a
	+a6Sw==
X-Received: by 2002:a05:6000:41dc:b0:482:aa2a:52f6 with SMTP id ffacd0b85a97d-482c0b41f95mr10002245f8f.1.1787318830006;
        Fri, 21 Aug 2026 06:27:10 -0700 (PDT)
Received: from [10.45.28.226] ([15.248.2.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482bf82594esm3408856f8f.29.2026.08.21.06.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 06:27:09 -0700 (PDT)
Message-ID: <12442106-e756-4902-b9fd-c760da04f849@gmail.com>
Date: Fri, 21 Aug 2026 14:27:08 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: Add pre_fault_memory implementation
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, corbet@lwn.net, vladimir.murzin@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
 <20260612162354.73378-3-jackabt.amazon@gmail.com> <ak5sAxb3G6hhFmBF@raptor>
 <alEXGmKiXgWPPdhF@raptor>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <alEXGmKiXgWPPdhF@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Alex,

On 10/07/2026 5:00 pm, Alexandru Elisei wrote:
>> Does it guarantee that, after it completes and returns to userspace, the
>> address range [gpa, gpa + size] is mapped in the VM's stage 2 tables? Or
>> does it guarantee that the address range was mapped at stage 2 at some
>> point during the ioctl's execution, but parts, or all of it, might not be
>> mapped after the ioctl completes and returns to userspace?
> 
> Nevermind, spend some time thinking about it and it turns out it's
> impossible for KVM to guarantee that the memory is still mapped after the
> ioctls returns.  So I answered my own question, thanks.
> 
> Alex
> 

Yeah it's best effort, as if a vCPU had faulted the range itself. This
could be undone by an invalidation or memslot update. The value is in
the common cast (for us, post-copy migration) the guest doesn't pay the
stage-2 fault fault cost at run time.

I think it would be worth me adding a sentence to the documentation
noting there is no persistance guarentee.

-- 
Thanks,
Jack
