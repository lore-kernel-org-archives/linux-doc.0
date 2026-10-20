Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519102;
	b=5KJZT2vFX9OEHAaHN5puhm/NQCrNholKNnpdzWUxU7GcZNCd2SyXhM+e4CiqpUyoN5Ot
	 SkzwOtcOmgYQ8OgCsxMVSKmDOn6DI4E/mcBetFuLOqukz/yDt4bsMUBLTlCf3xVQHe0xi
	 4sTm/uANww3wAxiMa+DeNRDoe7lRpHC8Rcj9zEMbhobmj1/m85GwSNhUvtMzn4MyfmQHS
	 5OmqO6V/wuUGrSAubHuXiUj6UaNM6+Ky+nv3CGzbqnjxCawNIbK7DYQNDxCd0CtbyCXAu
	 pSTdaTfWS8jSb9CSt/ZYb4HX+kkWCIluNO9T0vH/hoIkB0wG7U6K5ZqHiVbpaQutEow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lfvzxumMX8GZYmj1PJHBaPnkGMwtjZCWGV30UbLz0Q0=;
	b=beXZ1u8fYhS5uRphxefkHvem5R7OmdrHS2sGMxa7FnyeDmzgpTNp3HKl+gKTN/nCgjws
	 CQaVL+We/l2IUOWQ7zO1wVRZvNKMA0AIUQUXg6LgOg4qq9QLcS6KgnnDSlfHRa/fWdkKO
	 9BeEGli0QgnO0LlfdO1k8y22Z/S4VDEZgvrYWEcXd3GYU5U/qxpihYItyWcUW9kM3AxBK
	 gGqIJxnps4ce3n3DXnzXR8hCiH71F3WmfPFJ59RfRyQynJmEXwgiamHemgsnPTiyrdylp
	 XSg8e43C5tDzb/0BKBpzn0oYTz4gtAxaBWaGl+sMI/LTKsuq6RMVRwXsh2zdscfhUmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="hk7DKm8/";
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D82606A322
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 17:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80D82606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hk7DKm8/
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac749e0719so976526a91.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 10:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519102; x=1793123902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lfvzxumMX8GZYmj1PJHBaPnkGMwtjZCWGV30UbLz0Q0=;
        b=hk7DKm8/HVQtDM7SfuNCgwbY6d9oYkVDTzKvh3xFFVJcjWgeTit4nQ3APKC6JcXMvs
         5b1sQ076nR/cD60jiZzZnASVUl2A1IZZGCAtZTv89HFO9xMKTFkmD6zhLqjP8L3wg7YT
         EZ+XvNHUBXYD7s1wo8gn6iYgnI1fN0liSodgV4PIsesSa9bemHyZzT4hLir3wzeKGmpn
         2cfYdmBPyJQrErJTZ2N9KyeYzowC/aQbw4VYo0vWXFp7rwMFbz2ltIGvlLTQQcEQD2Dv
         OdgjfMkoZTll+JU+ZxsujBTKAj8fDZLFfw03WYAg+wLvoNDOd2pzWmEdC15h4Plr2owA
         0SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519102; x=1793123902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfvzxumMX8GZYmj1PJHBaPnkGMwtjZCWGV30UbLz0Q0=;
        b=lZlwrSC5sAwiu0T67nDF1KHYtqhJov60eUk2gpnbIYgySFwGQ29751JYPO1JqGYo6c
         PdpoKgRkwXkrnmJgDHNZzPmaMk1lfeYla6g71WGLeoi/QnZxFJRg1TleAXGq4qiCIn8/
         nSVq4OP6piE4V5CL/VZJmuLp2iWl9yhPi5nzUelw0iHhVLI6IRFy26SoKOeOGLnJ0Jbr
         j4yNInCR+tO1/rubfW01YWqRE9P/U5h/OwvwBj037teZ9bFk1QmI44keOOw/gDJUmrk6
         7HSEITlkOCtDqiI12TaJ12DHhnmwopIx3FYlbS23NSL5xfRx6xP46KyZLIK5H1/9Qoh7
         eQ0w==
X-Forwarded-Encrypted: i=1; AKwUvBy0Bf1WgcLZJACimDV/RI23lW5nrwkgp+P7FALybiJJ9G8RDE0kHxYt0ivg86Js0NSlujGxxPoQx6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBZEk96wSilCtXrKRw7gTY4SS0UrTeul23eU/cL0PW2DT13PjE
	bX3UYI4RG2K9kqOZtqTGn2Jp+Tljf/YTxLPlNxnX7Zry6elvlcmFtHsb
X-Gm-Gg: AYBFou2wQJ4HtIMarc5FtleE73H145AQ0buCw3tHKTR7Rj3wZ8CXzfltPOVeEAaTXiy
	b5dPvatwvVLMOyuEetVRkC/gVirsaz+F8LrqRWvujYL06CcEjHTBDyrfduSPg01Ep+7C1eaD0Ze
	Pv1gwAdkhnqiFBf0+4u5/Gm4dv0Ub12E45f2D3477b3rJ2gFu4eMwpQGIkNE3XvYACzzEs8K0ns
	0xIaj2q5imSR0SsMQX8/xrMFhXOGhQ3ZLb+Bm2TKldfNCZaQYER2JV1BM6Di/BQLsbmWDyteel+
	yQZKGv9TII9t48tyOLJIWd/WR7FeZAiYbd64/DWuRNSE3cJEBlYoyYBBM39TO3+FRJk+QE8q2RD
	Jx/TEGuLSwRbExPI7nK4i+dY4QdR8eZ775lgDZ5kRfBdG4ALckrdv4UlDoa8fTuwvHt3+d9111W
	m7/S2OIKt10mZ7h1iY7Mx7XH00L5Rbb/B3X0fBYzEZjcxmkI2Y1yuOU6NzsqGG1NdGKVtYS3aTc
	v0gTJkQZlZQRwa5oBDDYkHJ1MCrK5CXJYkORpzQVXlLnWjU
X-Received: by 2002:a17:90b:4b09:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3aceebb4bb9mr10542274a91.14.1792519101713;
        Tue, 20 Oct 2026 10:58:21 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:6::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad82f0c0b1sm133581a91.0.2026.10.20.10.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:58:21 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:58:13 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: Willem Ferguson <wferguson@cloudflare.com>, netdev@vger.kernel.org, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	ncardwell@google.com, bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [RFC PATCH net-next 0/4] tcp: carry a BPF-chosen identifier in
 TSval low bits
Message-ID: <atekzexnMd27Kctl@devvm7509.cco0.facebook.com>
References: <20261013103906.2660384-1-wferguson@cloudflare.com>
 <atFI9vl5hy09Dc0t@devvm7509.cco0.facebook.com>
 <87a4oaf3mv.fsf@cloudflare.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a4oaf3mv.fsf@cloudflare.com>

On 10/19, Jakub Sitnicki wrote:
> Hey Stan,
> 
> On Thu, Oct 15, 2026 at 02:45 PM -07, Stanislav Fomichev wrote:
> > On 10/13, Willem Ferguson wrote:
> 
> [...]
> 
> >> Questions for reviewers:
> >> 
> >>  1. Is encoding an identifier in the low bits of TSval acceptable in
> >>     principle, given the trade-offs above?
> >>  2. If so, what feedback do you have on the implementation?
> >
> > Don't see any feedback yet, so from the top of my head: looks like you
> > control two sides of the communication, so why not a custom (bpf) tcp option?
> > Would you need that on every packet and it makes it expensive?
> >
> > Or any other field you can abuse maybe? IPv6 Flow label?
> 
> Nah, we don't control the client unfortunately.
> 
> Client here is any device that connects to our edge PoP.

I see, so you rely on the fact that it gets mirrored back.. Btw, looks like
there is already some similar tsoffset/ts_off infra? Have you considered
plugging into that?
