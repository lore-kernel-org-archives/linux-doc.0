Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154919;
	b=Q7LWViOaQnHFeqw8cq51GBhWJ/cLSsk9M0MUeTDsOgYswvYdMPB19KgMgxVgOZGMeSfH
	 qt1hl8ED4auXIqoWUnygA18pR84q7gsjc125lGnQE+eYMQw9tlP6PZqAHZ5YBMIeCSgl2
	 2Wp5tKEokRhJFwXoRpFxJC/A3+sxbAqoFW+iBxNSomlMHNf4uTl9NZdfl2+rHhW0rNAci
	 2wGDu3Sup9EoLDIOaBxD5yYR1T/JSxFY+ytkF/Fhn0nYd8H/oKSKX3elTZ6iAVZ32jC1/
	 Fq+SW2DpX/xPbGxWTljZWrVr3Rr2AgOK08qOWYyi0aqNXYHM6BiRy039XZcfnNdWtYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=NqiEvNJc2p38Ujj7TawQCPTCe9qdBp/ccFJptwABHsY=;
	b=jv9FXbTBX8y8B407cwM7/PQiCJdtpZronm6KHSJN40/69nICw+9YN0EIoVt2o/cOiZL9
	 WXEDu/JbQdNp1znhCHWLQ7X9b1LJxyffmbLSJi3/BpBIvjl3qThlVPGP+IQC+mDRBvgIZ
	 RrHk22X6egOkNiW4sDTPVBRNKHR+Sv+hmh/i+Kk7kKwh3ejjfKw5t7ts28ytXUkBp/yx4
	 71g3lcrZWWJrw6CmkGG+7dno3j7GpX5IzpncComAZ2PxIKwIHD6XgYE7O78AF9OlSP5IB
	 zUEJusqees+z84XnFruxylBGgfc1e76NIaGIpOxK0hvcnXwa4Ce2jTjrc1Owbea9D9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ByZKqEY2;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1379606A320
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 16:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1379606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ByZKqEY2
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso706175e9.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 08:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794154917; x=1794759717; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqiEvNJc2p38Ujj7TawQCPTCe9qdBp/ccFJptwABHsY=;
        b=ByZKqEY2fqDhKWoL3BQKBZjth+x/iOlR20ruT+hrURNxCRwqYtsum7eZaEhd63rm50
         +GHBf5keyZIJ8BcMAlMHs7ZqsCdBnHF5w6cKrAqTxfqgHcqd5LZUhSdc/J/1gf4lqQaX
         5UsxhwT0VO/ynoe2i+sWqm9U+7By9WCmpaY0Lox+wkZPKASr25srJMuEjQHsG6shkRoX
         zhsnz6GCHInxjthTYMvu7UTKBmUrrtFOAyIO9PXkdTuZBmhEsZGDOJ3mKNTIsAygQd5g
         Tjq/dCJww5DtLMaK56lq+wtOcBNcgqgy63lXfEQXZnFZTlaw3naDMUuP1VQzT8d77Qf2
         yBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794154917; x=1794759717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NqiEvNJc2p38Ujj7TawQCPTCe9qdBp/ccFJptwABHsY=;
        b=oKAcnEmzTiPiCY8XRHVMakN+lgmpgiZrfHmuQS57Tws8hQcGc6elybFS8MfGk2cn6z
         fQnGvBU1AI6A+esbc7f+JWiKK9gp9E2HFE+R7CZg3MspBgdeJX5vMiMntDpFGeWKrNTs
         30rNMGdgwPY5RI/UQrrBjBTSJhX42jd64DYy3DU+IfX39aGfLfBb+tO0QzVzAcceLbjk
         3k4X5fWyn1GWiT+rKSaAVE5sBbPkTQsYJSvVVnc2i4TLG6IZ5at7Nd7VCJq7v4fpKqvS
         AqUpYCIDuyLjtzXw8EgI9vInluk5nxLCbIQLdVUP2dSWYimv+uMYR72Yfg7eN2+cgKsY
         tjXw==
X-Forwarded-Encrypted: i=1; AL+hErHfXUmj9IPqwN4gta2m9edZmzZ5vjwnzyw4sYoV8Vu7m9mPZgJ7iiobqVD9X0CTsKh+/m5iIye1Nls=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h6AT7IUKyNhCsbYsmmnmA8fmWmSrO+a5yM83DQ2wy+NwfdhOp
	IldrAFBoLCEGaZ3l3Xyjf3mMcmn5inEkNpW9klIO9Y/PEunzsgQoxA4DFx7VAVEs
X-Gm-Gg: AYBFou0pG5iNHZO7zr7oAuIcSWn07pTHRcoYjj/QkTeO4RuGPCvA3V7bTfYRQDowLza
	3H2ZMAzyYq4HvLDRiUF7OwhclHQUNcQisb9ahKNYE4USbQ3L43deyW+I5VuRXHI0bJ8U7GwUgvp
	qrN7/sfUZyX2GZOF3GbnDB75kDkEi1sVNPdXgpAvL2ykuG6Mj9p9wTDoadb46KQaLra3iWLMxvs
	aWrFJZ3TuF+S7j1ABq0CwU8t7VmCgEDj4VeOivBhHZavpCeRAlUz68GUE/W2RA/lG8unOITGIF9
	UcKeTffF+I7sTjPSKIdUl/j3ygXfi1/bKLdJevAoMTEUOVZgdc9Pb/WPyt0KefvIvf4nsEG8Txm
	WTtl1wEncIcYynP29guAMWY47Zwe9isleSP37i3PubSkLGlSG+N6BJcMvWuqJN2vYsINosTtyX1
	qnCyvPfpnUtkK3ENXfHFa2vn+4ADln9uDH2dbRxJ/7sOk0kGFzQhb2leweLUMSvF4/XlpbNksV/
	Qpdvv/NRf+BoE9w7jGe6SIw6kPH0fmPKO4LxBakBcK1FBaeEKx9pf0BbNidQS7+5y8e+54qmdnq
	jo8bmMOfh3oxCxpH0CoCv4nAI/qlFNG2PgJg6EcjEzgKiB2NrWLm
X-Received: by 2002:a05:600c:3f16:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4b9633cee64mr34051605e9.18.1794154917053;
        Sun, 08 Nov 2026 08:21:57 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7d54d6f93sm272669515e9.0.2026.11.08.08.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 08:21:56 -0800 (PST)
Date: Sun, 8 Nov 2026 17:21:51 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Shi Lecun <shilc2025@mail.sustech.edu.cn>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	gnoack@google.com, Fengwei Zhang <zhangfw@sustech.edu.cn>,
	Bryam Vargas <hexlabsecurity@proton.me>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: landlock: clarify F_SETOWN signal scoping
Message-ID: <20261108.5b4268b47da6@gnoack.org>
References: <20261107.2f1fa9977739@gnoack.org>
 <4C69C1457B12AD80+20261108055048.3745750-1-shilc2025@mail.sustech.edu.cn>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <4C69C1457B12AD80+20261108055048.3745750-1-shilc2025@mail.sustech.edu.cn>

On Sun, Nov 08, 2026 at 01:50:48PM +0800, Shi Lecun wrote:
> The signal scope check for asynchronous I/O notifications uses the
> Landlock domain saved when fcntl(F_SETOWN) configures the recipient.
> Adding LANDLOCK_SCOPE_SIGNAL later therefore does not retroactively
> restrict these pre-existing registrations.
> 
> Document this boundary in the IPC scoping section and link to the fcntl
> documentation for I/O availability signaling.
> 
> Link: https://lore.kernel.org/linux-security-module/20261107.2f1fa9977739@gnoack.org/
> Suggested-by: Günther Noack <gnoack3000@gmail.com>
> Signed-off-by: Shi Lecun <shilc2025@mail.sustech.edu.cn>
> ---
>  Documentation/userspace-api/landlock.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
> index 3d45b956b640..cc9c5b102b8d 100644
> --- a/Documentation/userspace-api/landlock.rst
> +++ b/Documentation/userspace-api/landlock.rst
> @@ -499,6 +499,10 @@ The operations which can be scoped are:
>      This limits the sending of signals to target processes which run within the
>      same or a nested Landlock domain.
>  
> +    For signaling of I/O availability (:manpage:`F_GETSIG(2const)`), Landlock
> +    checks are done with respect to the Landlock domain at the time of
> +    ``fcntl(F_SETOWN)``.
> +
>  ``LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET``
>      This limits the set of abstract :manpage:`unix(7)` sockets to which we can
>      :manpage:`connect(2)` to socket addresses which were created by a process in
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.56.0
> 

Reviewed-by: Günther Noack <gnoack3000@gmail.com>

Thanks, looks good!

–Günther
