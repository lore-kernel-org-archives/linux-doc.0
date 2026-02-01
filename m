Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8763EBF32
	for <linux-doc@vger.kernel.org>; Sun,  1 Feb 2026 00:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769905425; cv=pass; b=erNWTu5Ud66JL3X/3JTHYdW8S5IOpj1IBEkwgVmB5pZcLqw/D5kmRoQouzlh5YFHSajCv7njAQyNWpZqjrkJG6vsLUOkrWWmf+/A/a5KECAHC7qnDpFXx8C31bCxJB5ytd6IDSYSJmY/QNEfllJNAJYSLTXAWq/TyNK9tx6xbKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769905425; c=relaxed/simple;
	bh=thTVQyzlk7R9IFzJml8nkUcawBHd5bq8DMugFSDesjM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=O77fERUom/BZo3OptLZTcC9x2snW0qASNtP0oZhpHPuUcUQxMXP022m6ZkUDK943KwP/TlUpcpYlJU9pQpAQ0mSyMKDAS5GTmjz723+7ndVJCITtIrUfymrm2VM867oHhZHQPe9GrCCfq0u9BJGtdXXPfpKOq2M9tE46gIqONOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcux8tX+; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcux8tX+"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-662f91bba0fso2440272eaf.0
        for <linux-doc@vger.kernel.org>; Sat, 31 Jan 2026 16:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769905422; cv=none;
        d=google.com; s=arc-20240605;
        b=lrgZ5/8eqFyXuzcillr/3kFSOCZ62T3qufQ8J3BtzYrWMN3YtbDnHG2Az/aBb2ECWc
         C/vvJWDPEIbJrU1xltktbduZqAuc9pQFPyijoU19lA0IxTWzbh01JNgR80oZ9adWoJMM
         pDsno+tzE0iEkGEKJGMFEfou/Rx5vEiC7mXsBvIF5umFL6Z53EG9lv+vLT0g6NYnyZsv
         x7YZDbrbVIvX2kYnhWI7V8bI1HuwPT6PQ6P8a8bWDGEdFCFgT/rJ5YBuyRT5raqpS10Z
         +5c/xhz+CxJ/Gt6gUSTS/3ShwF/tVDU5RjZaQIskgzs4Uwly6e+UhjpdQI4CjyKW/vAv
         u2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=thTVQyzlk7R9IFzJml8nkUcawBHd5bq8DMugFSDesjM=;
        fh=ZbonjbzJJsFV/lWPP+WlMJ1nkxs7eEVT2jwfomzjfAY=;
        b=de3VvcgxXTO5oBDUQTMUbrlD11cwNdvwf8L1E271V72PWD1b67DgtzhF7SBsWHmrR7
         Xb5gUro0XlDe3rYdRmQB0ZO2wNX8aAu8NlucfKVTMQfJf4uOrsEzjdJxedYODyRiL2jq
         NXm67NqInhf8rjVVn3NrPIjkaRsDJfBmFAgDOBqSQGXwxZE7elPmWrSbXKgfzp8XRFUn
         0AzcTOi1bwJC4Ou05EitANBR+i2vpnUZCkehdGTQD4APMqA2ewbBV5sfQlUcnPQli6hw
         fufwnkT8daM6IRf9LoO2OSA9FsAfrywCVWVGaTBB28n1SgIA9/fVzGz4aXoyf2kOnLkm
         nrcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769905422; x=1770510222; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=thTVQyzlk7R9IFzJml8nkUcawBHd5bq8DMugFSDesjM=;
        b=mcux8tX+h4QYA0Dr/SFzTciumckMV/1oYUJp3RkAtPHBNHZrO2mG7MY78ylQmWHPIN
         axl4MHFvno7WOSiqfK3XrSA5ap+d52R2DyUoNSHdq5VI9k79ecIevbSWYcGmc2eKJXWP
         hzM/4bqmymJVCLPdJWtyei8Nbb92LoVC+iuVu61FvtKMQ8oSnSrfaFHai2/tx6dw3NZP
         t5nF1wXonWJuNIa0uo8vqN5+RcopelnB/34vJVDKRSV30zU6aNXufs6ErjwnigJoVRXG
         4/icboWg/8TCHgvaZEAmlvWViD4H9npW8R0MZ7OsCMO2A8jUQuuJzrWJJM9BlfFBb0lU
         Mafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769905422; x=1770510222;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thTVQyzlk7R9IFzJml8nkUcawBHd5bq8DMugFSDesjM=;
        b=Oup53YWrnfAr6minD5IKqU2AifwqJ2HKVL/n5CoYXnaUyy/Da7g7wfvxb6CRcrn0QP
         XDgHUkRazzRKDAS3hPfeey3oh0xHm4Cui2VgeS6J5rVLQtd4qy1TaCE+Byowk8yS5re5
         eFSjCJ81BBl2tO1JR++DPYZtxy9/071t3dgHKZtAMbnU9M9pUeR1Nhspmk2XecJ92Dpp
         V5C2d3jUxdqkEPBNhrc4OOw8k2XwHc1jrBAOYxY6grs2Oli8FzOhFz2RRIYS+dtWjg+c
         wJNnhzR6or97FwRuRJ3VX+eLR0uD9TpdIAmw8fMsRmmrKim/LUUoe+0r7B5BxtQct9a1
         kg2A==
X-Gm-Message-State: AOJu0YxoSiF7lU1u8zjP8OmPm5HAmEGt5Qhju7CHw0BmclmZGPUbM1kA
	vvVtQ3YV93tNMhMRFwzveUzvG9N+3ddIrcnBeIDm9CTVHi4BSeqgDFp07gRWU/SXClCbXZAC3PT
	0W/ZNPcTLfOamUXPKEoNwiqBUJlSJqmKnorEYNmI=
X-Gm-Gg: AZuq6aIn+bajjBHFeSF9b4sYiEGBsn49dgGbdup4JumXnM3VW6QFFpS7FZQ524y1JHl
	ZYK2ObPOuOIz1qbs1s5ndYX1Iv6hv8NUpVJmu0FL9Rp3HAiasnKoIJt5I48tdmpIIOhRjFJ4d0s
	HilRWAhM8uqEmDZQw+Be3o22E9RwuCemiMGXNgACCm9MB/EHnxkthPvDbd+lHigykuCFnZCcwRs
	QE4iUwBua+KUg00odz106Yy+q/wmgiZzmZWGLBjUumSz3k7WfJUSf/6mn4gX0ESddyKDg2IFoph
	WlVwP2+D5Y2xHdMn1pgmUtMh7J4diB53sJCE1NAJKG1bMtl4K7gTz8OOqHXtlg==
X-Received: by 2002:a05:6820:450e:b0:659:9a49:8e2e with SMTP id
 006d021491bc7-663061a13bfmr5037205eaf.32.1769905422208; Sat, 31 Jan 2026
 16:23:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sat, 31 Jan 2026 21:23:31 -0300
X-Gm-Features: AZwV_Qj9o7bjdfPUWjjPULQ0vAfQekEApHb2lgRU2VEVj4L5L4MQdfDrIQRZF0g
Message-ID: <CAMAsx6dzNMHYA630UWtD5EJX5QqyT9BqJX03c5QzHN9EizjQtQ@mail.gmail.com>
Subject: [QUERY] Guidelines for starting pt_BR documentation translations
To: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

My name is Daniel and I am a Linux instructor and systems engineer
from Brazil. I've noticed that the Linux Kernel documentation
currently lacks a pt_BR (Brazilian Portuguese) translation directory.

I have started translating the 'howto.rst' file and I intend to
maintain the pt_BR translation tree. However, before submitting any
patches, I would like to ask for guidance on the proper procedure:

1. Should I first submit a patch creating the
Documentation/translations/pt_BR directory along with the first
translated file?
2. Is there a specific coordinator for Portuguese translations I
should reach out to, or should I send patches directly to the
documentation maintainers?
3. Regarding the MAINTAINERS file, should I include myself as the
maintainer for this new section in the same patch as the translation?

I want to ensure I follow the community's best practices from the start.

Best regards,

Daniel
