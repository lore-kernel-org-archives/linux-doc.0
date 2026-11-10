Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277545;
	b=D0aT5hwQob3Xu+jcnAMcDzZQM2HxRmkLXKgQeL+Ts170A/3W3dZcyOdZTeYiiYRGrDTf
	 jbCV2N/kXjPiDa4gN+32LVpnGLe7gXEiRVS87B1QP7MkNf/31cja/kyeLnyyJaI3AlV1v
	 /VB2tC8Jr/dptIAm7+NwTweEtRsJ8mMU1Be7NUv8iYKJ3WIkO98zfx/f9faonFgs2W5HO
	 nZ8X+3nMki/b2+R6sIjl8YkX1xerL8+f6AW/KkQrfmF4jEZ5C2Pfsz/9Qkyopd7Cfa1Jr
	 vGyfApJQfrF3anHVt/iHkowEIHS6OPuYxgxsAbj6IrimWpo8iUCpP0NTuqPj7SPBJhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XPldadiNKhoZegiaTvf8CiokX5nZmrBDQdfxqSW4DgY=;
	b=OYF/+By9ErfYzo4OTK31DwGjUKzxXm+abFDGx7GrUL2UDyLuBxMnUwo5/TBMM4g1t4vl
	 FQEtCHkMnDeFUyoqo9GYs4iQ6TDLEqVwPd0YTu83nIWAN4s3HjGtYAR0UjAxJzBi0YBpM
	 iX4/UFjvQXqC6apJoKPa5YtZ/QLqNeXncn9ZM+iV5/ClYaGVQdWc1I901E+lNi2D7c/Z+
	 DHF9Sse5lLLHDa6byObY0iA9bIaVl4vq7j6VQHvmES1ywqU/7iZBsfA9OUAzY6Yo184FU
	 ZpnXxo58BDOKlRm33wtsBAtfkiLU5izo8uGwtrFrn8VsdnZPA443BYu7m6WYaU9tBpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifJwtyRO;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B6D606A31C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B6D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifJwtyRO
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3099453eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 18:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277544; x=1794882344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XPldadiNKhoZegiaTvf8CiokX5nZmrBDQdfxqSW4DgY=;
        b=ifJwtyRO6Rvdzuf5RXRzy7ct3bd5CDyCkVxVZpgd3Ig6fwQCkbp9KCt3ko8KEqpJru
         +sCzk8uSSG7rXdzapbnIqrOGkYEaG+Df4Db5RHwWm1YItysfhd1KuA2eUZLvB7Kcba+p
         VbtAagVe/A36U+j9GgCSF0JGtBR6vM0GLoVzw1E3A8TSLNILkr8HKKtaB+wugRaeMxWe
         VVB8UH2KdAmUi9JLZlVDVhfCQUljK/+np0pHR+Co5sUEkvVMSBBX92wDgZ2Adyhf/UH0
         BLTWe3yxFuK6W/HoFJvfcm7TuhmK+m90MJgw6anlnCBS1u9UYKPWakerbUgz+FUgyg4n
         +xSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277544; x=1794882344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPldadiNKhoZegiaTvf8CiokX5nZmrBDQdfxqSW4DgY=;
        b=RTGl1AmHaW83r9BCbJmi82yUjXvJ9YHBFjECf5R/XUnl7INTh26cYLuSGd1ah8QnzL
         Sf2nZFMivzwSojgMqtkSAAQLnTiH0k6pYnofTck3fAntu7Dh1yEB8u0XnMjdOUA2+wgX
         i5UIkH/IxI/V9vEt3moi5C6o9K+UHhp/uXNZkmkvist/Tb7pO9KO98vWLl+i4csEVx2t
         bDIpC7h6+9QNr28rX23kvC8y0OYbUPyt72MMqOamSbFwnsY+vmlWnsHyLWOPpz5Bhtxt
         q1038dI0eJBraMjZo3l/nb9dBeQOo0mYhhLmtH1ga2UsHrbl/RPJks3Pe9ijJtPBLPFx
         IwJA==
X-Forwarded-Encrypted: i=1; AL+hErGJzuCwbjriq+rtrsWlY4N9YDfnmMfJP1dZSUH/ZTZxHoje5o9VzNafiZ+EYtu7u3Mf+z4Czug9X1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e2e4u2BIkyZDmI2wkvQ3Bf0VBlF7gs+7fXii/ecVtE/vQiyIG
	ipDSCdL1XSimnyqf3oqan0MdR3rLnkHVP4DpJ74jrXKpehJjfdicSW23
X-Gm-Gg: AYBFou348eNUIwmcGP2VBkZjek1ZM8dHjC56M+yrjGSrZ/qSI7ncV4B3UOKRRMVIj8A
	GfdTAykpw1iLzxnWhImm9976jbOIPtVkcU9A/ZLWU8zYXELfkTfnoSiTqMQx+1ziPgzMs5GINiz
	rnPPgG1nuWqEdLbI7+AIq8+FOg/obBiwv4zOl2TLo8/y36RkRVHcMN4PQif3bEJc6REnaBFc6hT
	crbQm+XbqLzUwx4EaSj5xRswCbtjIRluhc0lylaQANira848l8cfW8P67SZggJNoECfnd2/da/W
	C3AQFVJj28nVEoKKb+Cutx1qK5H52+7yfd3eJ65KxwpRjECpxqE9ehCtEmMc6E2FvO71uoJGui5
	V07jFcgrdclk0EK04XTgLn5bR4j6qEi7CXxACitkkPc12qlJOGTF4dsfYICTCeAD2Fw1bmUi4DY
	guMVBP199YMHML7tacx5ZRP0HIiaqDUWM4XmX3YRCj4e9xxDqHByO0ej8MDIc7NNBM3kOvUCG4U
	YnoOBlZl5s1kx2Mg+PUVLkug9mpqpbZpNmVUrOM6ONy5eTQer4+AjhOvZse/nBRXFbpTDyn5xOj
	dAHOwSSDWGeV0XfzdPN1G74+KINT0x7Cg/h4Vi/qyU63CcGTUPrCAG3X3mrHoH+jBoW85AM=
X-Received: by 2002:a05:693c:894d:20b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-37520215e02mr1487679eec.38.1794277543714;
        Mon, 09 Nov 2026 18:25:43 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:856b:460b:b522:14ec])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm2213095eec.9.2026.11.09.18.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:25:41 -0800 (PST)
Date: Mon, 9 Nov 2026 18:25:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Siarhei Vishniakou <svv@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Input: add ABS_TWIST and support it in HID and Wacom
Message-ID: <avKAaJxlxE8gOYVV@google.com>
References: <20261110020632.4003499-1-svv@google.com>
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
In-Reply-To: <20261110020632.4003499-1-svv@google.com>

Hi Siarhei,

On Mon, Nov 09, 2026 at 06:06:29PM -0800, Siarhei Vishniakou wrote:
> Some styli can report rotation along their long ("barrel") axis,
> commonly referred to as "twist". While the HID specification defines
> this usage as HID_DG_TWIST (0x000d0041) in the Digitizers page, there is
> currently no corresponding evdev axis code to expose it to userspace.
> 
> Because evdev has no MSC_SCAN equivalent for axes, drivers and OEMs
> currently work around this by mapping stylus twist onto unrelated axes
> such as ABS_Z or ABS_RZ. As a result, userspace input stacks must
> maintain device-specific workarounds to know which axis carries twist.

How is it different from orientation?

Thanks.

-- 
Dmitry
