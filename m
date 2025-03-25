Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873C42E3382
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742912433; cv=none; b=ckPYP6h5OTfqWbKksFalE6c8WI3eIyPIeJVctrTU7zvWmijFVmYL9FHvXUJQGRV+bvTBoyQ+SzstAT6VC8owQMsu/vsRzn5llVk/SBDlRyLcdmG1dhugywXGa5O+oShuXG50qp+c3wDOJ30tbytbMmXLiV1Ua8ijHjW3RnFMDN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742912433; c=relaxed/simple;
	bh=6R9zA86q92q5KNyTPt/KezT2KM642idnT1llXfBvGGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bxPUcEnHmBNaia61zhdwLZIrvVblH/ez/S5d4x7BCE4lidXUxJlkENTUKjixZnaCb6jmIqyJKKrjVuBWXPJkl+XSSMK8eiSKZUnr3YXVNASJqUh/rfPJCdmoncjqXBBFgFANqc23HkosJ85utRc96Y8oYG7lk519vbzEmk/O2xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=vsRan22Y; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="vsRan22Y"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-477282401b3so39359931cf.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 07:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1742912430; x=1743517230; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6R9zA86q92q5KNyTPt/KezT2KM642idnT1llXfBvGGY=;
        b=vsRan22Y4qwsj7yKN39U0ifO+/D//+MnwCOwtjNMHJqFDDYu+RMDhq+O40Axj6/Um1
         rQIPN68gNjNB3/ge5b/8vkr++gSgSFwsHUqP0zuNFsXl8lWCh5zoLwDRteM4rMphdK8j
         cc5J1VaKQK4JMKyJGYMhrrMZDIhKG0b6n+fmBpMOvS6sb/p7QytQQz47aWZESqvv0YTl
         0x6jeMJSkFayACKpPoKzesUQBO8fNJAkwbvhZaklupQaHAi8AcRgURw8vEDgyFN5Cx/O
         3ZeBweLhvHEf1pzWbPbymKvhYBAzNnWccownXDGeQFWWElvqnE7ruqcs2tW0gsBfKq1o
         KV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742912430; x=1743517230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6R9zA86q92q5KNyTPt/KezT2KM642idnT1llXfBvGGY=;
        b=HUjfzjQYy4bYtFAZCTv+ppEu1zqgUinMO6LzlrKZ6+MD/IX/zuUw+DTMeo33Y1d+Im
         bdhA/KB5O4DnOmbUoG3ziEzmNky0/DlE73a5Hgp3xH7A6JRIi/99dL4BMg3kNZWCbYJH
         UdautMUSlSqsQ9QVH2H9KTgHlEcrXqDLP8/zS8ev9iLF6NZmboTQ+xndbVppGa3ROjCU
         Vd+07eGFM5jzuQtMK50okF5cVC7xt5iJ3Sn/eoy6so2ZqECyjrgNH/LQd5wayAJ4DXl/
         +HM5X8Hv4ri590qDKu6iwqGIAA7Wx2Ow+pgqE21zdFudRvNK1Mwk4myHjc3eJ8LTddQu
         9baw==
X-Forwarded-Encrypted: i=1; AJvYcCXO7ok7mMWFUE+e/mFi9p0/qg48FpYKk86sx9ptkg68DXWY4s+p9enVbjoqZITUKNHo4MlWbwkua/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY09K0A+v68hE8QLoIjsXvd+4pKhN0yWPOym+xcoazDAh32BIp
	wq2zehfmQ6qZkfO1BPuWiUitY4TgNjv2T9XG9GDC9xo9B3bIGLTbWjnhQ42GJe6JhnrQthfetai
	kHM55Z2n7Vz3Wt5x2Euam+uNeZZIOfDGmZULn6g==
X-Gm-Gg: ASbGncsrQVlqNlFF4CjjStVnFiIYXqvv9V8dyBMRxEDtYcc5qCmSMUGdOhcoZ0GVpA/
	CAhsbyf0FtnSbC5jlgoluvweAWxwo0pEexIDmjMJWyH4nkU4DendTrBBocMGMP/rzfu8vVvMSxd
	Vllo5/wNrDXj0BY3NkEnZ0E2Nq
X-Google-Smtp-Source: AGHT+IGc+rzcOSqRq1NAurG0wArv+f9TNDXi3NJHkDUdzPbqAqbmujaqTIOq09aOpi8XwtONse7qgR0mbQ4HEgDxOjc=
X-Received: by 2002:ac8:529a:0:b0:477:29f5:53eb with SMTP id
 d75a77b69052e-47729f55467mr169156461cf.6.1742912430244; Tue, 25 Mar 2025
 07:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
In-Reply-To: <20250320015551.2157511-1-changyuanl@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 25 Mar 2025 10:19:53 -0400
X-Gm-Features: AQ5f1JpBD7J0LGV4vivBPILeYhry8D0ETPzHZusd7bV5-E3dLFdBAyFaK8Fs_Bw
Message-ID: <CA+CK2bDtBk=49hbz+C=fDswz_Nbtj8kVjsY-pTsmBt+O8YPLmg@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] kexec: introduce Kexec HandOver (KHO)
To: Changyuan Lyu <changyuanl@google.com>
Cc: linux-kernel@vger.kernel.org, graf@amazon.com, akpm@linux-foundation.org, 
	luto@kernel.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	hpa@zytor.com, peterz@infradead.org, ptyadav@amazon.de, robh+dt@kernel.org, 
	robh@kernel.org, saravanak@google.com, skinsburskii@linux.microsoft.com, 
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com, 
	usama.arif@bytedance.com, will@kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

> To use the code, please boot the kernel with the "kho=on" command line
> parameter.
> KHO will automatically create scratch regions. If you want to set the
> scratch size explicitly you can use "kho_scratch=" command line parameter.
> For instance, "kho_scratch=16M,512M,256M" will reserve a 16 MiB low
> memory scratch area, a 512 MiB global scratch region, and 256 MiB
> per NUMA node scratch regions on boot.

kho_scratch= is confusing. It should be renamed to what this memory
actually represents, which is memory that cannot be preserved by KHO.

I suggest renaming all references to "scratch" and this parameter to:

kho_nopersistent= or kho_nopreserve=

This way, we can also add checks that early allocations done by the
kernel in this memory do not get preserved. We can also add checks to
ensure that scarce low DMA memory does not get preserved across
reboots, and we avoid adding fragmentation to that region.

Pasha
