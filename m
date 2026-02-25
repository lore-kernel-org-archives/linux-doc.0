Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB253ED114
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772041260; cv=none; b=K7AapkeMpGW83dnxpwKz52l0sN0bGmAawrHZroZQgmQfuOdnAWoIy0V48d6vGFPZ36WeaxvpNn6AGQxmYkakCLhXJcqShy03J7RQptYO5fVzlYedc/+BfsfROxAvE7soKxsCK7UNvfsWGP5RpiN7XoBx3IdaGcCMSEA4xCHtpVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772041260; c=relaxed/simple;
	bh=vfPVzGsOpxFMqLnHbeOt97S7ASvz/dPPsmfURT55c2c=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=psan6Nu9oLLSaOg8cdyaOc3nOrD5nZqJnOWA4bfiH6nePWmJlXAEpoTnz8I5eEjCvvkkGDWlAAYmkPRQPRq4Cu/PmUhjiB2X0ubgjZOcN11SaiIKGd54oTCEH9UC0t/2J9bIphScX8Y0o+gxLGIhEs3tHQFg3WCHxnom7zjzLA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RFGlMuG+; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RFGlMuG+"
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-7d496d080d8so41055211a34.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 09:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772041257; x=1772646057; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vfPVzGsOpxFMqLnHbeOt97S7ASvz/dPPsmfURT55c2c=;
        b=RFGlMuG+RlBMZrbOsRHSvqyhEwvpeQcTEJJ6pxS/L1GkYKdprHSLNvn0+CqMjCdmq8
         GJqB7lFXU3ZEixmIuTAQTT5v14RH9CUEiJ1bUNpeAJc8R4ox6Mz8r0qJAkicg4UvpHjJ
         G8+VYutk2uWcIi4Z1R1Bo/M3ZoEBT0G7lNZ1MD+z4DDKpuM56Hm+Oirty558xOYgWXPp
         BwbcJmqAS3hXfLbOKsMkUqMzhv7vY1tUBtG+hnKULyozp6sk+8LO6rnsPs6uDFAHZ2Ev
         fqCcQkAHOMuFB4zx9KQkzYAJ+K5uFnNvV7M/Rom9vHhyv796wUcfJZDb9xWBfwo1hZd8
         M4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772041257; x=1772646057;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfPVzGsOpxFMqLnHbeOt97S7ASvz/dPPsmfURT55c2c=;
        b=Xf66C8/M+R9XP9MCN/Ypl4JZ2D074I7y1eBWNqqcWHbVpr0Nh8G31vH/LrJR1LPPus
         Ws5bIWyZTGkd4ZgcNE75Vu8VSU4GB91ovTwjcuDb+0t3KhKUNK000hARBjD6GIq+yhwH
         xcz3qUc4wZscZjhkzJ2O/5iXaJthWLmnTtJbX9KAZQI8X+aLz5OoXcn7qIF2wtplVn5T
         R6dlSTvn1GM3D1NqBqdJA3vKdwEaWqT2KIMNw0k4QiPC0l1gQjwQ2G70jKK3Hvhkswxr
         llFxzXw2iNWbKefRaqyPvRkixYBJtM+X97nOyBzHw083iiEBVa468bUvQGxb9ScYJ0Nd
         71kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeO87G7qrz83V9nEdhNfLC7xNX9vGV8dfhwZ9air/aV7D/mzkkDCV1QbBflONCLa8ycTnu9vG52QQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3KL2lCjOjqVqYeTIZxP2PD0f/Y8q6S8Pbrb3fYTWEK+eZzaL
	y3nhkm1bafsO3jn+rutMj/AT/Eg7SgyfZGzm4HrLCAf91jfYnZyLOHULSdox+visIYoAMwwSFJQ
	5s4VPHXcrPJ+Yfd6LJRdZktyjCw==
X-Received: from iluj15.prod.google.com ([2002:a05:6e02:154f:b0:4d2:8640:5d64])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2019:b0:672:e67a:96cf with SMTP id 006d021491bc7-679c4684cbcmr8062877eaf.16.1772041256681;
 Wed, 25 Feb 2026 09:40:56 -0800 (PST)
Date: Wed, 25 Feb 2026 17:40:55 +0000
In-Reply-To: <86h5rlawru.wl-maz@kernel.org> (message from Marc Zyngier on Fri,
 13 Feb 2026 08:11:01 +0000)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsnty0kgoh5k.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v6 00/19] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Marc Zyngier <maz@kernel.org> writes:

> On Thu, 12 Feb 2026 21:08:36 +0000,
> Colton Lewis <coltonlewis@google.com> wrote:

>> Hey Marc, thanks for the review.

>> Marc Zyngier <maz@kernel.org> writes:

>> > On Mon, 09 Feb 2026 22:13:55 +0000,
>> > Colton Lewis <coltonlewis@google.com> wrote:

>> >> This series creates a new PMU scheme on ARM, a partitioned PMU that
>> >> allows reserving a subset of counters for more direct guest access,
>> >> significantly reducing overhead. More details, including performance
>> >> benchmarks, can be read in the v1 cover letter linked below.

>> >> An overview of what this series accomplishes was presented at KVM
>> >> Forum 2025. Slides [1] and video [2] are linked below.

>> >> IMPORTANT: This iteration does not yet implement the dynamic counter
>> >> reservation approach suggested by Will Deacon in January [3]. I am
>> >> working on it, but wanted to send this version first to keep momentum
>> >> going and ensure I've addressed all issues besides that.

>> > [...]

>> > As I have asked before, this is missing an example of how userspace is
>> > going to use this. Without it, it is impossible to correctly review
>> > this series.

>> > Please consider this as a blocker.

>> Understood. I remember you asking for a QEMU patch specifically.

> No. *any* VMM. QEMU, kvmtool, crosvm, firecrackpoter, whichever you want.

>> I had hoped that the use in the selftest was sufficient to show how to
>> use the uAPI.

> The selftests are absolutely pointless, like 99% of all selftests.
> They don't demonstrate how the userspace API works, now how
> configuring the PMU is ordered with the rest of the save/restore flow.

>> If not, I can send out an example QEMU patch to the QEMU ARM mailing
>> list.

Okay I sent one to you, qemu-arm, and everyone else I asked to review
this series.
