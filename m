Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611C03932E1
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 18:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782688; cv=none; b=aLgItHzjX+Y11Zusi1iKPw5g91Qt1hWmlVeLfP+RGreTHSMZgA97vg6Z2wyGFy7+e/vKaIsFJqzQEMhKk/koMXDLs8mgLHPSfhgoQx0hP9SiyEemYgjyhLUHyxlQ1/ljv96QjomawIvaaK/41kt6f2ylw+84F94zKKVw3uGct1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782688; c=relaxed/simple;
	bh=D1x5fT+4M3h9A+n3GevBUFwrT6mX2gnVVGmoS4I2vSY=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Wpy30iu9a1XhLc1Ill9lTxVLCsEJgT9S9bChO75tAnbp7zs32n79jSsThTb4NSOaqQxgpMwa0I06z0bVBpjmkgnsY691L5EC1USzjBuPkjN1VWd+nlveYilbWiLMd+BnGQaWvS+xZL7i5ccsccIVK+naUmzXtUOgyJCab2MMFss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MG1vHEY2; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MG1vHEY2"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-7dcd9061254so16396255a34.0
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 11:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778782685; x=1779387485; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Maojrdkd+5w2XWqqGc/P00CzPWv+6mS70oBhALVRgBY=;
        b=MG1vHEY2DOaWbE2yUj5Z1uoklRrKNislzb9UTDmPgHV9qScfu6/gF+U9kuvqSh+PHY
         5r5djp7dhJ9aow66MHDzzbovcOh8ZuM9aNfMRLyXz/0zW4U5LUm90lQiPxjZX5GzkYOU
         KKLdVf4LSBP5934EohQal8XQb1mU4nDUUsDLXxhpDfY6ubY4XZjSza/9UGJBpGYWiuDE
         N0eLNuypozI9q2LGp6omPhq7pmtq9vEvvsbVQoXNkFTnfi9Mqs5XDLHf5GIoIO1RZWl6
         Xzpz2/W72eNAMjamryIOsqJxMjK7P/GQ0l9bLDhlymmYHxAP18+l+yKP4V0ZbJzbdiSa
         0yQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778782685; x=1779387485;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Maojrdkd+5w2XWqqGc/P00CzPWv+6mS70oBhALVRgBY=;
        b=Tpl1sGTypUPMk5H3QSmODVF4omCqPhLy1PngAwlj9X2vOm45nx3J7Us96aYMHDZByH
         +kqLX2gDxj+snz8gxsvD57je5XrQ3/6su2FWPqDyvFTQga4hLKzagawlak04CFo/y2Ql
         Yy7a4x/XFoJaahtbuWv/JA5DblTWs9pMdJ6ShurLexYJp7Xa2ci6mlLM/8/hlnKyr9/D
         /RbAm4F1/5jFN9rW8NRZZf8GLnHvncY02NmV/PBcY/Ah3zsGHSqxI0AzJaFjiMTJy0NI
         h22Q5nNjUvqO7NQ2DpIeIvRPFxAm9G2WcnIoutkzUx+63zymNcI3JQIm2hudHeEGdewP
         W+YQ==
X-Forwarded-Encrypted: i=1; AFNElJ8I+s+9FMzuklF1TdpGbPqITK0tm6A0Lxm9JX5n0jyMmccDUVwF1cZojNBMwADra0TChGxenmGqSmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4zmhp9BN1iRw6x/pD0Szgl1ce/g8holie/YZBwNBZFR5SeGKq
	M9u995DUbLFEDd6HKbVDmVggphnFoaC+ykVxJV+VhmzrTJCFY4/WhL4O94ZbIODPaoQ9D2naEB8
	NlTdM2rYBJa5gzAM5hsxBT7d0jg==
X-Received: from iobhm2.prod.google.com ([2002:a05:6602:f42:b0:973:4a64:ab4c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1746:b0:684:bf61:ed25 with SMTP id 006d021491bc7-69c942e1b26mr401033eaf.19.1778782684266;
 Thu, 14 May 2026 11:18:04 -0700 (PDT)
Date: Thu, 14 May 2026 18:18:03 +0000
In-Reply-To: <agQsM7XFsbxbFRLO@kernel.org> (message from Oliver Upton on Wed,
 13 May 2026 00:45:55 -0700)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsnttss9c0tg.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 08/20] KVM: arm64: Add Partitioned PMU register trap handlers
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	james.clark@linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Oliver Upton <oupton@kernel.org> writes:

> On Mon, May 04, 2026 at 09:18:01PM +0000, Colton Lewis wrote:
>> We may want a partitioned PMU but not have FEAT_FGT to untrap the
>> specific registers that would normally be untrapped. Add handling for
>> those trapped register accesses that does the right thing if the PMU
>> is partitioned.

>> For registers that shouldn't be written to hardware because they
>> require special handling (PMEVTYPER and PMOVS), write to the virtual
>> register. A later patch will ensure these are handled correctly at
>> vcpu_load time.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>

> I'd prefer an approach that provides a single accessor helper that takes
> a vcpu_sysreg enum as an argument and internally handles the dispatch
> between partitioned and emulated PMUs. That goes for all of the PMU
> sysregs.

That seems ugly to me. It'll need a giant switch or two to re-dispatch
to the correct sysreg handling when we were already dispatched courtesy
of the function we are in.

Are you thinking:

single_accessor(vcpu_sysreg)
{
         if (is_partitioned) {
            switch (vcpu_sysreg) {
            ...
            }
            return;
        }

        switch (vcpu_sysreg) {
        ...
        }
}

or I could do the switch on the outside and duplicate the is_partitioned
check but that's the same as what happens now with extra steps.


> This will help you reuse some of the PMU emuation code that you'll still
> need for things like nested...

I'm not seeing what you mean. Could you explain further please?

> Thanks,
> Oliver
