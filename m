Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823184;
	b=ttGSRSs0lDA1cH1hK1y6BuCGJholiyEzL/2R8Nshc/hdThMkGY/sx+hqMbo2Vtd17HUx
	 5jnXI/t3iDoRFjyofU5w/OskM/XMttP4VypsmYQtYRlq9Whx5RyRNbvraIpaftQyXEOD2
	 2+Ohq7rp2tKN2fQ0D/iL7EfIr/6hUYh/YcuKDMGJnRaA3YnYzlPlKRHoWHxyGIcSacWVq
	 j5TgO8FUEBCeiMMmR57DQZ79ZH1m2aR5JOxbhsUpHXsOtcPVIrI/L/5PqL0jHK7LX+Auw
	 q67124X6MgiTyk/ZZKA4McSGtuuo7CJbyKV9YgyDdbpiRgF7wtxaksVUgZXIPAOuZEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
	b=sItv+xRYNqOJ7zaOCLLnLZHI05EKSubG+l1T5AKSpbYvKpSY3zgcFy9afB38iK2OWCkE
	 BdqnnPFMMn1YdQYsvm39J+zdZRVGT9KnF3LUXVMOJUwNkSkIilxRHIX6V9dxCzZySTcnF
	 KEiEFOGm5Jc/0PDJ9wT5RXEliuiQZ0+fsIgwucPqOzKTNfFj6Zonl0kUbHuJ5gaAKaNFJ
	 G1TanHoFAXg7levjWNdkGvMYlK0UXA4DoMXpLeUzO147HYgiw7tQ61T2WQH++2R72qWq2
	 oDsPrPCP3TayKFCsqLMpcQk+7YsT08HRO6Vhz1fpvc+lv/EBzYGwRWp52bF0WPz1Pdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BGpCtknc;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CE060807B2
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 20:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42CE060807B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BGpCtknc
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b566cf56c1so863192a12.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 12:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793823183; x=1794427983; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=BGpCtkncWdvUeLCevd1EKqU8Wovu4/MUPYh2TngTSHS41zQfnf9W6eNl/fXz+AH2kI
         KC/IDNYvqXEB0VXKmwIGunLOoxQToaCLL5hUDTNFUjrxmoEis99MP/HDJvsn7T4WImKF
         BtK8EpoUA58sGcltpA8Hz0F6NtSOE60OJaelo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823183; x=1794427983;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=o8IGNTNyYElyplfQt4VT0CUOQCsJxZWthlhtAVbIx8LY4keE9ca3jsN+yNtAm5GYbP
         0u6nX8qFmHBEj3xtUSvu2fXXoQ9KB9nnSd0LVxwLDCoVdu7SXbu6gh5gi/KYe07kFPLY
         Nk8ck/g9D5pmkd6ndaYxrAEN49WNhzNw5XaQoMKhbDNC3KDsraopBYMLnj+dpARDIUT2
         mB7jo88XKDm1sYGkwQ3j5ifCm3az5umdFgyMz5tQV1VICR7p4Uijl3sjW/2SeMCUT7YT
         Jsh7lg23C5vfe8r+frzloSv9sS8uumLX4B3QsnbFKLbFDUdVpgR8TTssmkOhMnxXgpCG
         sWMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7rc/KUeUKjULOD2IBCRL9G3jpkxkB4/PbzQhEMuHDQGigm9TWmdV7RWDuN2L0ZG4R/ajC+BoCZgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b0sODVQ8ePspxunRaTr3+QnptXl3ZKaf3T330cpvEGmSNzQYM
	L7PUQbUDqDQ0UkRIxLc3aLB4ZlIPg8mcSXz7779Q6FqeeEOgrj567W5uFvTtS66CwCsj0ecM7sy
	DPNhbaDGEqg==
X-Gm-Gg: AYBFou0KicPvWpMHJUap23FA9pltPPH/GKaPfNaq2OoSpLJXDdguzxUvfubiyyuczM7
	9QmHzyp+fltYfCXt01LrqhLTqnwHHJPWeuBT4BkseSFEsWmA+NRZCBeJXv9qvvbuBgt/ijnvp8g
	+HLb64tb0OvkfAhTjQmeHyIrPNBaUJ4BPTIFQ/SeXROXDPAYr0x39WOBUSm4otep7VeBzOFqpaQ
	aoPYBOUQ2s5UI6/62GN6Trw+/JiCBc+cOSQYHNbmWU4LzvGwaHosWll/blc834L5I4HSgAGmn9S
	0E0iX8K4YyGT9aPof69yl4aFCJ+RjuRj/n6+Zx+UkQfq481GST54V1kIJKVWMpSchvoGuVTjPXn
	ZN4MY7gyVGy99jo1FVt0dskuiUrRMQpWSvAOk8mNrDWEkX/L5QTWfWK8xqNbJh4AHGuOJ3AQ1Mk
	9jpe2a97SDT/eowQtC1wdNWJjTS5pxm3UntCBYP5kTEbz/NQC8ZdCuXXubG5cQC928NJHkPBQc3
	8/yar812EfYkPx8UScIaj1Hu6C/tbPzintPj0bTFCRUcIBtGzfMgve+gHTg1nVDzoUklME+mVIH
	299bBTeLhZdvFh+8RGyHHaFinpXhpOykeLMQYRoKUeqwAk++cxNQDfni3cTvDNHaIPZzURdsWLx
	xKg==
X-Received: by 2002:a05:6402:4287:b0:6ac:87bc:8b16 with SMTP id 4fb4d7f45d1cf-6b4d62c30f8mr12908044a12.44.1793823182777;
        Wed, 04 Nov 2026 12:13:02 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55abd5569sm1158182a12.5.2026.11.04.12.13.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:13:02 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b566cf56c1so863180a12.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 12:13:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw0SRrBmnMp7/sjfHe7uVVQKanjTASOp4zFULAMJDsG0BumHZFdGkjJX4G8uIn0cRwDDv6rECFl42s=@vger.kernel.org
X-Received: by 2002:a17:907:60c8:b0:c49:a4b1:9cb1 with SMTP id
 a640c23a62f3a-c4ca795fa50mr1973235866b.3.1793822725121; Wed, 04 Nov 2026
 12:05:25 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner> <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Nov 2026 12:05:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
X-Gm-Features: AclHuK9j_YIgrwhhpWOlnull6heAULBd4dgTqoOhUQQjFm_MgoIgrL1vgPfefvI
Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 11:49, Christian Brauner <brauner@kernel.org> wrote:
>
> Part 5/7 of "proc: move procfs to what kernfs does", on top of part 2

Christian - way too many patches, re-sent much too often, cc'd to way
too many people.

Nobody is going to read these repeated resends, and all you are doing
is clogging up peoples mailboxes.

             Linus
