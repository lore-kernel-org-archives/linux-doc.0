Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897556;
	b=nrA/W1RzuY0KKSZ+OTH9cmAth/Vcg/evue/WtbPLoOyMvso9SVLMpVmD4CO4VZYnBEwF
	 Nt3QzKpt0i6dfPuoJkDvxikvgxvTXWXmOjrvGineGNwcn1LrfeSEibRH0ky5rrFN6mZda
	 PbXym5Qp/C6U7VvAo+0Mk/yMienpi8oqGYk8w6Af76Hx6bGQAJqbfZkIQvP5Y6oEr62uY
	 LRAo34OHUv/KOCPtLSRl/+6y99j+lLZu8Sg7wy14zO/Y0RqEVNwvoOquqHniTYiEDgXbj
	 KZGEJkb11cx1SKcugQyyIphMU5lzqsctFHQjpDXtnxmN18seuqUWh0mftdioqkRgBIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7+a5U8fHtsX3E5MaoZwCfMwFhX7Hac3DauAHwFYDfPc=;
	b=gEjv7+0ZSzLWHodmhWAJJTc65NgWXV+0FiTR4+C9ZlqpHF6UVdhmMjbvxUB04qAoX8WU
	 lNHoAiRFhTmfuxjWC6bqEYzIl9YtTMkh/qMUG3O1FhSi5tDILjForlSsJcDMdlu9fSiSr
	 9fMvvVoYWmvU76PdwbWr18GnODJGh87Lq1JqwTH6qc3uLQHn8ZTSHF0Wu2qNca5qOEvK6
	 wN2PSxDkek0JK4NmX3pGQuTjRmLqupPM83EvmuRs68ov1NgRYu2uCUIqZU26grQqhhVE7
	 IXxMc4bPBVdTYFoLKWmlmv8cBt3Fd4jxG1HI8nk7ANxFzNc09lL1fu3UPD4b/G+rpHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZaFiRQUK;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5E6606A326
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 16:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C5E6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZaFiRQUK
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so1732383b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 08:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793897556; x=1794502356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+a5U8fHtsX3E5MaoZwCfMwFhX7Hac3DauAHwFYDfPc=;
        b=ZaFiRQUKfZJFVzifn/C/ajTSfxmaCvGX3Jle7wF9HEq26kVfdJhkNI85deTC9+GPkD
         dJ2J+G+JaPtl7yuzutPE+02HFhbTDllUO0/Olyq1vi751iINisqTG44rAG1dTk/goMo6
         /PBH0AQhRfTnQou2C1BKnWmHSY7hoLyqXufqbbQToozfQtiPSoRdZnoCZFVkvKz1S6cX
         GQsoX8CZj994K8Wc4ae94rhph+OYwlKk4yHqz1GFfCcbWJL4FDmtFc9YXV4DpsFBpzHo
         SJzyGao74a2Uj1H/dbM4VZjvOPNF60tv4GgzkhLTCt4CkfoZOpJyO61HUBw/VqSw7HeA
         D6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897556; x=1794502356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+a5U8fHtsX3E5MaoZwCfMwFhX7Hac3DauAHwFYDfPc=;
        b=j1jvSrV7plKOygCwsM5K6rCeVHJmsI+NmMFHHBqAgsuKIkuWhuMzfU5H15W2dpE9Yq
         s/G9kvOGWDw+x+p1CAtYydyT7Lk94Xg15xOLkq+D+Mn00jse310ftbw1qhhlPSfZzYwt
         vm0RQg0TvGtMwO9XS9SGZWxofO+0PmjYIzZJCuoiGdR3wepgggfdvwEvXJv3h1TX0ZQc
         MJpaNMo29hmaHd4HIuhyrzYUjSQjM/i9U9wEmTvqd8WCOwhz94sM2pcMTG4DxwJVyvZC
         lWS7NCpA80ys4/1RSP81zZzGpQXiskkat5OhzGHMPDmBKuCc+EMjmOxypX60zZyR84ft
         6ztg==
X-Forwarded-Encrypted: i=1; AKwUvBwe7AaDGpSDhn9C6W+QOSoMTGigTlIsgwIkJlZ1jee/5d8QZ+ktcmRzH+deuJV58UqpA8Cb5CZDhmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z808+Ofbp2WcYrUmjD48YRjDnKBt6MIZPPSmiGAWCVqJ3efL2mQ
	qrjOdCHnz5HSnIpxd3AiEe88Pgff98B/0rJy5mKCVL6RiX5MeF+zMaO6yYzJeQEXXQ==
X-Gm-Gg: AYBFou3M8sXvQnctmwaDDsM4zPn5QEV89igdVd1SJ/XLDnO4kkJD/OagosRNR/tgwH+
	bVBu6sovv0/cqPbI1GtIzWWjcgHSQg1RbI7XxhWzPrX7boZZt+QD6X4+fo0c8u68ikXT2iSpiHj
	BNiGQ4GEPt9cJ0fDzg1kDYCAXW2EFjHTWtBZ6ThHk9bWluhIvfUMY0t6cCtmrjhFNCARytaZ9sq
	MjggIla51eJQzgY021dNUTAUSeSSr0z1TggkMWu0wJittr20RgKT60weMsj3JhaSswYarX9Y5H5
	l6QPgsam7cYWMO7buDf0UQt3y5fpiwhaoKlNQeoLFQYYqSUgPkr9TyLcx2XDUwrJbuYHOBb+Od9
	BYrvwAIvY0K55qKwV20q6iTldK2LSUDj5qLBkZ3+OM5idcHqhD47iK31ZaobYfTtfiO5qxGCJTq
	KHbWEetQcMPczNkFA3tiPJQfd4ungKp8QXCLUiQhX+cnZLkwfuNOBr+c8kfEwjMaX8B4huw4Oza
	ivyYFYqC4eAnpXsAcuxFXh8+JGbCKo/2tRNeTXLJccIF2+ZSql7nSOjRaXSCZKOvZG0ILIPcvBm
	g9j3JVRbIATganJpaSr7hc2Yu3so3Pjig2XSAAiVjNDMAkGoBA0ctr/Ue7HJJHDG3d5jS5Z/rPg
	xwWQWhTVWFA==
X-Received: by 2002:a05:6a00:e11:b0:882:359f:ef17 with SMTP id d2e1a72fcca58-8a9bb7a0b64mr18260859b3a.12.1793897555111;
        Thu, 05 Nov 2026 08:52:35 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bb48410sm2298197b3a.46.2026.11.05.08.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:52:33 -0800 (PST)
Date: Thu, 5 Nov 2026 16:52:30 +0000
From: David Matlack <dmatlack@google.com>
To: Christian Brauner <brauner@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 00/10] liveupdate: Preserve tmpfs files across Live
 Update
Message-ID: <auy0ThryqW5nVx20@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261105-sitzordnung-nahkampf-ausbleiben-6db911d0333e@brauner>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-sitzordnung-nahkampf-ausbleiben-6db911d0333e@brauner>

On 2026-11-05 04:42 PM, Christian Brauner wrote:
> On Tue, Nov 03, 2026 at 01:02:06AM +0000, David Matlack wrote:
> >   4. Retrieve files that were preserved from a tmpfs mount onto a tmpfs
> >      mount chosen by userspace, via the new struct
> >      liveupdate_shmem_retrieve_arg. The kernel creates the file as if by
> >      openat(dirfd, ".", O_TMPFILE | flags, mode), so the file gets the
> >      same flags, owner, permission checks and security labels as any
> >      other new file in that directory, and is charged to that mount.
> >      The kernel fills the file before returning it, so nothing else can
> >      access the file before it is complete, and userspace links it at
> >      the path it wants with linkat() (patch 7).
>
> No, sorry. That's not what we discussed at LPC and it's not what the RFC
> and v1 did.

[...]

> So instead of LUO handing out a file descriptor for a file it invented,
> let userspace create the file, O_TMPFILE, O_CREAT, whatever it likes,
> with the owner, mode and xattrs it wants, and let LUO put the contents
> into it. That's what the RFC did.

I'm fine with going back to that in v4. The retrieve argument will just
be a file descriptor for the target file, and LUO will only restore the
contents and size into it. Everything else about the file is up to
userspace.

> The checks on the target are trivial: a writable fd to an empty shmem
> file with the inode lock held while you fill it. A tmpfs file can't be
> sealed, it only ever has F_SEAL_SEAL, so there's nothing to restore but
> contents and size anyway.

Sounds good. The one other check I plan to add is rejecting a target
that LUO is already managing, e.g. a file that is preserved in an
outgoing session and whose size is frozen.

LUO will also add the folios while i_size is still 0, and set i_size
last. So reads, page faults and memfd_pin_folios() wouldn't see the
folios until the file is complete, and if the retrieve fails partway
through the target is left empty.

> I also really dislike file_open_root() for this. It's an openat()
> emulation inside an ioctl which is completely terrible.

That is fair, it is ugly. That all goes away in v4.

> > - Is patch 9 (retrieving tmpfs files with O_RDONLY) worth merging?
>
> No. With userspace creating the file this doesn't exist.

Ack.

LUO holds a reference to every retrieved file until the session is
finished. Since the target has to be writable, executing a restored file
will fail with -ETXTBSY until userspace finishes the session. But as
Pratyush pointed out, userspace can put binaries in a special session
that can be finished immediately so that the binaries can than be
executed.

> The preserve side seems fine to me. If you freeze the size of a file
> for everyone you better be allowed to write to it.

Thanks for taking a look.
