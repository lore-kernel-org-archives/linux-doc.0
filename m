Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9A64BCAD9
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 12:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811247; cv=none; b=GyGjCsP4knvUYxYOLVtwuXzBOmLZYIxlcwpeZesByuweE4DLP8ufbjlGp/wfA7J8ctViYQ88ItqE/gR43lE7U9wDEaLa93rqy0WyVYZopX+sMfWjdMEC2jFceyWjlZlSjs+DA9qEB/AFgZhrt7Wqcc2PYJlgDKAdcojgKT4gjvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811247; c=relaxed/simple;
	bh=hZB8/53s4mO4kIFJXxMOcWTQ6DBSxoSBcbhXg6lHpPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qmrq1/P6P5Ff5iOCa+UTdfM3ZdGXpE8lNaenrBAEs3dYrvjJPbNG9C4zXzJxv0VakjAhuZsgf4peLuBXBSlqJktFY3YAHc8QdjitMccGP/vdjR4N3nMLfq7ssGuor+as3sZFLc/uRgzfWAuntCk42iikaFKgIVAvn0wdki5Dxdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9uORScJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9uORScJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9DB1F00A3A
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 12:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784811244;
	bh=8mdNKx/1/auLHo9QJ52PoQVlLrWXzZVXJMMcXNeqKNE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=A9uORScJ6C9J7fjzv+pRPBzS1ugZ1LNws7DEU9Rw4rlV8pdQfwVI2ehqmKQPESt8u
	 q8P4pDXamQmX2ZH3yPg3rTADm7nfBQzDq6dq7Zq82G9KQGchtHRIiA4JzMSKLLZDa+
	 BfSErvxq1NDhR7DepqPNHDwleJ7PcJNiDHuZ5dEUud0YYNnjrs7VCv+suPH04zsVeM
	 ln0LociwmG2Q+bsWWZI6KkNMfoOyVX5NOLtB1PTKvrB4rZRrqQitnKVAw584+rc9a7
	 BVHKY5t9JS294oBlWBrFoVKOPtHS0guXm08E+KHJTUld33br796sPAJYoikK2/QWY9
	 7F6tjwRG1NZwQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so505831e87.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 05:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RolEdOR3k2UmzoZFZTTjeUcp5Rj/BykUVJErsXblKk0ctybVykHGURBU0YST7C6MPvUuG2sUqWRS0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5twQcWYC0YW77U36a8Gks55tlgNVLpWliYqbSFC+O6U8O8LWd
	kfwSB7E0NldiRhHOMxMcRE8Nh/BtEv+SdJ2HySMMlo919NphZ846KDHCx1MX5R8XuAZ6n5ptUDR
	Bkifs7OK/v9M3IMwpPAL4ym//kOlhdiOd2NLSJoor
X-Received: by 2002:a05:6512:1323:b0:5ae:a4a4:b6ca with SMTP id
 2adb3069b0e04-5b2b3332127mr450440e87.14.1784811234312; Thu, 23 Jul 2026
 05:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723-work-failfs-v1-0-3f69b9a9e958@kernel.org>
In-Reply-To: <20260723-work-failfs-v1-0-3f69b9a9e958@kernel.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 23 Jul 2026 05:53:42 -0700
X-Gmail-Original-Message-ID: <CALCETrXSDhrDzdGsknz0EpZkowm3OAPihyEU5Xf_Mb2CTr0SmQ@mail.gmail.com>
X-Gm-Features: AUfX_mzGKgWr2cRO8ep-8-hB43raCc8FcPMOawRl5wUYGrxfGA1kDuSSAZzVQBw
Message-ID: <CALCETrXSDhrDzdGsknz0EpZkowm3OAPihyEU5Xf_Mb2CTr0SmQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/7] fs: add failfs
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, 
	Jann Horn <jannh@google.com>, John Ericson <mail@johnericson.me>, linux-api@vger.kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Farid Zakaria <farid.m.zakaria@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 4:39=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>

[snipped excellent list of things one cannot do with failfs]

> A plain readlink() of
> such a link still works and shows "/".

This seems awkward to me.  I feel like ls -ld /proc/PID/{cwd,exe}
should probably show something distinctive instead of "/".  Maybe
readlink() should show "[failfs] /" or similar?  Both admins or
developers trying to see what's going on and CRIU might want this.
IMO it's too bad that we don't have a nicely parseable readlink output
for oddities like links to deleted files, but oh well.

--Andy
