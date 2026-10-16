Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706231A0B0E
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 00:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792111095; cv=none; b=E3OiUIjgV0sCjKCnW8GQhKmc/dDtHN8c10AAS3YDbPwDmwAqDjB9DRjWH4ZJuQDYE5iMD0FvILlaWSZv4UxHInPM/ZbCU0hAwysQ53tPoo2eUxxEFElGmGw8SzfJpidk/+wLKEAITri2wOm9t/iALhXhCrh/73omit5Rf+NaNDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792111095; c=relaxed/simple;
	bh=wJv6Oy02ZyVpQIEV4S+JLl2ZMXIUTlylj7/wOCMhJJY=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=JyT9NNJp04fXgsteNWen4vbJIq4xqjjY4RVKaIreVEXLWm3D/zZUF9uO3+pB7VwKx9sEpihrvaxm2q9jSw4rKmEHR6L0lKbVRH1Cj7E+zx0wL6Kv1qZ4vN+g3unEJLzMSoow4vaBd1k15oXfNOuUXqjJ1U6Bg6fiZpZFtXGVQc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3bkIh7E; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3bkIh7E"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db80fcdf8bso34305425ad.2
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 17:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792111094; x=1792715894; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJv6Oy02ZyVpQIEV4S+JLl2ZMXIUTlylj7/wOCMhJJY=;
        b=a3bkIh7Ee8Kg3CriNDEwX8oGdI8Qdq5fV8e7jXfgg0J1TidIHQ4ixKF3GGM/J9uPaU
         e9p3Qhm0hYO6htG8BQo38S6WoWM17XaFGJgXz52hh0QoGrW0FDwdFx014NgxccrzmPDu
         tgbpiLo9zoTQFGvOXV/dtf2i06sLTA0NjLV7QioPqD/w0Lj9OfYijzAFuzNuiRYVAi6d
         N0MAhUGZZgq6jxOVaP4SUrgfmC9X+wf0hf06uCR2fckrgo66IiFyfvGxl1JjLyDrCPO/
         S/vw5NXyrspYxKUnw5D8+EHgJ2a0J83wCznPI/OO3Clz8nc6Gz2YW1YzxBTBClAAqsCa
         L4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792111094; x=1792715894;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJv6Oy02ZyVpQIEV4S+JLl2ZMXIUTlylj7/wOCMhJJY=;
        b=pREhrnzb3FNQYEbsjMP+fvsu7LGhqN+4HmX995N9uMM6Rei0Bi0AkuNzvm3FYGQ0A8
         0YJyVztoZs5x8rc0q8odvV1mr0AfplGWjkGHw4lRAG+MS1NRd+FKH10kUH/L9tcPHWAq
         3Vt5WwvEMAuvN7YtrYwPSXm0yCQa1WTdfre/18+M4PTKfN0szTrR81loehNxfFCUgfQ7
         udxwW3eW7Hk9TIBYkN9HLp2rIAfgt3MKpEKEC5CmfT4WbKieeJ9f+em5GSGzih65CMz4
         /UgPe6iRcDNeuzdPhslcajEGYeBam5LNR/9OCmlsnVIDXvZEBV2Wq82/P891VifA7qix
         JB5g==
X-Forwarded-Encrypted: i=1; AKwUvBwvhtUxZ02g2wvJXAYIkmkqQRP+a75K72xFjRXcrbcYvXbdC+3DewwTw8oNSLvYo8PjCFuQ/gKg/bM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsvnAnc6MV+3AJ5w3Xx8dpgEn0IyOQfOGI5tOF35v9WhWHKo9G
	of0ibDXvNK55nTZ8jDD4CPN0UKNgWM9mYMAyuHxFjg38rMC1XSVgUVua
X-Gm-Gg: AYBFou0qeLPh/Sbtak3L2A1yUhm0HJo+MnZ1i3hhKcKs6USrOb1BchQR7kNMD6eLKXy
	rIfkaIGzz5SYgs4f9LXk4BLuTWUicuWJvuo+Ln0OO7ONT63PbaivWPe5ZfbLdAoZvTZJ35fFQUo
	iIedmL7TA/XMQqiP77OhRPXygq/mqIPo2+/7Da7f0BiMpC5Lhvtw4jb0GYY+sO04jPxOjUu9Bsv
	h/TiaGDh/QmbOjXu/Z2f2OqbOGEvSLu9Vd0jjVDz9DfjHDQwv0JPXV6QnWPrR0tqL7xUVRTeF8U
	bBci9V6oDW4ZL3P0x0Xq1zbn0ZJlNV4AiLqP74BzE4djdLt3bon/E+rSKzaFfID+BC2hoHDbEeq
	4dcIrHXosJaitduRWAQEv5QVFmAV1/28SHwetqPpM4o7qphTma1OSfN3jePnNqcu0Mdhv5Gkj1E
	2rqirUB32OnGSSkU85fn+NYYewHQSq2v0Ww6FHsOiH4k5rBILWhjHnNVghkL/0GEwZqqn7YK4we
	P1RPRviaOaqOomkTnzYXcwXKxCI9D47VzwhG5CTwFfr5OcMbZR0NGHFlislP7FPZZV7c0hRDeyn
	QOQ=
X-Received: by 2002:a17:90b:1d4f:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3ab3a94ffa7mr15824328a91.16.1792111093664;
        Thu, 15 Oct 2026 17:38:13 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947dfa00sm6462107a91.17.2026.10.15.17.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 17:38:12 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 00:38:11 +0000
Message-Id: <DM5UD20248FG.3BXPS76LK06F5@gmail.com>
Subject: Re: [PATCH bpf-next v2 0/3] keys: Add well known IDs for
 fs-verity/dm-verity keys
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Christian Brauner" <brauner@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Alasdair
 Kergon" <agk@redhat.com>, "Mike Snitzer" <snitzer@kernel.org>, "Mikulas
 Patocka" <mpatocka@redhat.com>, "Benjamin Marzinski" <bmarzins@redhat.com>,
 "David Howells" <dhowells@redhat.com>, "Jarkko Sakkinen"
 <jarkko@kernel.org>, "Paul Moore" <paul@paul-moore.com>, "James Morris"
 <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, "Eric Biggers"
 <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Andrew Halaney" <andrew@amutable.com>
Cc: <dm-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <bpf@vger.kernel.org>, <fsverity@lists.linux.dev>,
 <linux-doc@vger.kernel.org>
In-Reply-To: <20261012-broschen-inanspruchnahme-gebilde-d72cf2b99cda@brauner>
References: <20261008-ajhalaney-dmverity-key-identifier-v2-0-008456d189cb@amutable.com> <20261012-broschen-inanspruchnahme-gebilde-d72cf2b99cda@brauner>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Oct 12, 2026 at 12:38 PM Christian Brauner <brauner@kernel.org> wrote:
> Applied to the vfs-7.4.keyring branch of the vfs/vfs.git tree.
> Patches in the vfs-7.4.keyring branch should appear in linux-next soon.

What is this branch based on ?
v2 was sent against bpf-next, because
commit 264d8fd2794f ("bpf, keys: Add a bpf keyring for program signature validation")
is only there.
All hunks in keyctl.h, key.h and process_keys.c have its lines as
context, so the patches don't apply to -rc as-is.
And patch 3 documents KEY_SPEC_BPF_KEYRING.

I'm confused.

