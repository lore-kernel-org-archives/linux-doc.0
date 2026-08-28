Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669053ACA48
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 03:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889059; cv=none; b=vC7B2SQvKeZw2gvYhHalsNN9oIV2ie6V33CzFflzzmUMU83zHiw8n41i1P62ajTeKW2x58k8QZvLZ8rihu1/08oIWNWxq3aTmF46ZlALxNi2jvaZ/BkpzW2UWP0pXpBBwJwVM3qs6yLge11fjkExjdhEQiLs+F8f3u9dZBdW4+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889059; c=relaxed/simple;
	bh=kq43sLBz2ZHXLrl07cvrQHErCwpMzQX0LD1VRAlDuTU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=RPq2YHGKg6zGyRUb7cMcTfyp5d4tVLxKKyQabjjn1n9Ans8JWTYXhlqLGMXOx2WQmMa7w2tjFUWR2AQNxCriiW6CYwqUZ9Rm5dt36Qrk2mxCc6LQskkwf7ojf16exVw5LgUm/puJlvIcoJVj0ZMoH0h/IBR51nl2F6+1Z+O2O1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7U4HWhw; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7U4HWhw"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e041ea211so713643a91.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 20:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787889054; x=1788493854; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3KcPIBnQ86fi9vMxouOV7SSnCq2u1kcpTpfhzejq3Hs=;
        b=R7U4HWhwLrwKMC+FupEIzsfEhLvkgpLRjCuG3fdRGIljVMKbcUWbOmNIafc+8KVkyX
         qzTfcd3PB3t3/jaQD8N50cEdW4hbc410bFTwUxI7LwATn8I+Lpqa/mFKJyComo2SusIV
         xJwGDdklVmGtT46XLy5JByHJf983m3WagzUdyOFq0XRQZqjc0zx4C+jsFzpMH8TE4x3U
         Sno4HDcLKkj3+2hW/v0XuOwqDjeTHBou3395tlXX2tr2KKxqXZ5cvFzfFP5485jbhwJz
         zsvaC0BLJA/2+GdpRn71zBgS2LJuhOEGC6szDvEEJ4bDnO5p9b8cX1QskMBPH/onhBU1
         jrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889054; x=1788493854;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KcPIBnQ86fi9vMxouOV7SSnCq2u1kcpTpfhzejq3Hs=;
        b=dfTRwAJGHxoPe/nxYs1WrhDB+XVIM7gygo879CSEBaBlcgjinJvh8w3O2ynPefKHXB
         luBr70xsMxMMYW0IZtC7gsMcdDkExso8QFyRvBH3tHIq9EIkOBRb8wQnk5ej0kg6vYSR
         bbOkalqqrQ7UKwAyvU/5kULHHpLG7SfaRz/xvIiHACXT8aOZZaa5Ai7jVjcLjowLhzwr
         k2W6SWBhwWCsZiZpf6930RX57LPQ009MropHdQNnIKmLrN4PVpFYsj2UJeYTcr66IWX5
         puoaE6AmsyPdrFWGFlWxokSwsoCclEa+sDmocEQZwNIu/iaKrpTTZo9HGrwDvdq9TIQK
         UNPQ==
X-Forwarded-Encrypted: i=1; AHgh+RopBynTx74/0v5r+oObKZurJjHkccai1srnjBkOfm3tnan7IMwiuN0oNWnHeIdvnJeISOSVqyfGH20=@vger.kernel.org
X-Gm-Message-State: AFuF++mge25nPIqJSxfqObLjg4XlXNC2L9aSvpohfjqvatZbQSAFZe4Z
	o25Acm4wzqH4UAMmcspAV72wU7SPPoDiAKJk0qxHxKwlRWVgcoPBXl71
X-Gm-Gg: AR+sD10TB5BglUq5S6AmtMYSx4dGkrZJ5zqtDdUHy8O5HrWPfnKeA6QKguBLu7wnd5C
	r2uZqBDMTJpFroND8p2UmTB/U21DCLRrrwkjxhg8TSlOccYIjt6eS62QBPkBmXq/Ai+onXqMMd4
	4yLQj3eOVN2J31tsRh9H8HudcN+Jm1sXiijCwimJn6SzWiujsTuKg0E2kgnfKRYvHD/j4mV6xGU
	SW2I+JsWmv1uLj1lZFwc26Ilw55aO97VhTsgcAeUnp74BqTT1+oVtJuiX6ES/X3s75gLyOUlk8A
	akikdkVbxz18MsrFg6MsMM9mBd7qaWb6m4CRioUd3a3YUNwxNbULTBvQ0pBwrl0xmGuvh+2x03w
	CaP9Yt7RghLhVvDXejg0zyrIpHGMidFttfzd5rJlwv5Nd3J6aQGRec9yYiny7nomAiKDB4rL/1r
	GsmeTWUyyL1TbDn30PoqwfYoAvCZ9Rw+DAFvfIhTd2i/EKmDV4/TiOT9kNoz6A2epYhw==
X-Received: by 2002:a17:90b:2d82:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-396d0f6f8bfmr8174751a91.10.1787889054288;
        Thu, 27 Aug 2026 20:50:54 -0700 (PDT)
Received: from [127.0.0.2] ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0e0e67dsm1659184c88.15.2026.08.27.20.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] binfmt_misc: only let punctuation delimit a
 register string
From: Farid Zakaria <farid.m.zakaria@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Jan Kara <jack@suse.cz>, Kees Cook <kees@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-doc@vger.kernel.org, Farid Zakaria <farid.m.zakaria@gmail.com>
In-Reply-To: <20260826-work-binfmt_misc-delim-v1-1-43618adf8599@kernel.org>
References: <20260826-work-binfmt_misc-delim-v1-0-43618adf8599@kernel.org>
 <20260826-work-binfmt_misc-delim-v1-1-43618adf8599@kernel.org>
Date: Thu, 27 Aug 2026 20:50:28 -0700
Message-Id: <178788902860.3236768.6730484936359324341.b4-review@b4>
X-Mailer: b4 0.15.2

On Wed, 26 Aug 2026 17:55:46 +0200, Christian Brauner <brauner@kernel.org> wrote:
> diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
> index ddfd3aa57ac8..809c91d21b39 100644
> --- a/fs/binfmt_misc.c
> +++ b/fs/binfmt_misc.c
> @@ -100,6 +100,13 @@ static const struct binfmt_misc_flag *misc_flag_by_char(const char c)
>  	return NULL;
>  }
>  
> +static bool misc_valid_delim(const char c)
> +{
> +	if (!isascii(c) || !ispunct(c))
> +		return false;
> +	return c != '\\';
> +}
> +

Is there a ready you did not make it a single && ?
Feels a bit weird to check the negative;

i.e. return isascii(c) && ispunct(c) && c != '\\';
(DeMorgan's law)

Reviewed-by: Farid Zakaria <farid.m.zakaria@gmail.com>

-- 
Farid Zakaria <farid.m.zakaria@gmail.com>
