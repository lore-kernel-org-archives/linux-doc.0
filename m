Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153E82747B
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 01:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757811803; cv=none; b=AeKjKHzlgWN6e8XBw2JzyAojk5CDIAeergT9F8nJQMobka8TUHcaIaStdwLMd2NqSQ2ty5wAXpGe9Dk41ngTnpTCtMxNX5ixJ8SkfwQoPAKQGGKggs5HYBivvVYD4QkBT8Fkkk8K1kBZFgNizcfrC6EVaDriBwRXJyWF21pzIuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757811803; c=relaxed/simple;
	bh=+9K+/N5C7IlS+WITWDJ3HV0SDwHHeeqn4hn1ZxnOHWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyFRVTY5iC9DQoov0tewTvY834VYLoU+iiRmBc064T0h80hBOM7WtjHm3/dX2rxPnZPY7e+IcUHk8ZfkDmoroCDAEQPayvwQBPFmrwNmLBNikDQkfBGNC+bYwcyycUscAhhDF0cP5atPgyasV+SIRjEj6rU7ThMWLnhlU51t76k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UX9DDF9B; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UX9DDF9B"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-25669596921so29778225ad.1
        for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 18:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757811800; x=1758416600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VLYD3TrJnWWZ1Mr9VGKhucjc/Qr0LcMf32NCeLETcbE=;
        b=UX9DDF9B9bcdO56T4FuROtNHOVlFTEHVyjX53Vun94RC+NrjUauKPQLJ66ppA6kFFu
         yMr77nP2Ur9ntia8orUl2B0qgBb3X2gMfSAM62UZuQJt5KPbcStS0pYXh7DryL0i1rRe
         BlUrikm4JSLhO19hdaGivlMQAN+cmtJqgXKugIAyJ39NjEj8VF5vW0O4bKalXWP5bzpk
         siYekAot2WVv/ruouLs0CTYN3XQdzECCu+XnG5He9XHD7Buq7oC0ZeVvyisGVZm6I6W5
         mRYNaZt12i1IDgcitt75qsAw//QW1izMfvwE8l8tVIqpuX/QwPNZNfbOcCXFZKRCUyAv
         VzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757811800; x=1758416600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLYD3TrJnWWZ1Mr9VGKhucjc/Qr0LcMf32NCeLETcbE=;
        b=bpGfLoK0izOq97nPeGQjiq8xsZKEA7lJgcZsC4Xo+PLA1gTUUcV7UdN9TAkxYkaaLJ
         iUfl4OTY8wLli8diIxfy/+Rjm6U3YdgdcvsAZ4iJylWXiSprjUgaMuETsdKWGIZ2Dj+o
         iMyZSisoGodgvmBUtU8k8Sg3otduCKrshLyqmWtFjrQ34af28wh2UIF/rQXTz/1ASZSX
         fXGPDNw0vXrTLseOlAWWMsyTg+ejz0cANc4ajyoP/K/T/qZebzbTOqX0Tg/u7yIKZZ19
         Itq5JNfYw8CVIlxS/uv34VO6p3K2OXOi/D5R4jBQSDNS1WhIw2jMefYl8e6Um0zPM4e6
         wVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdJRZbFHV+e4sN0kpx68TmQHBm4dW/Vo7BSRlJ1BkMJc89gn8mf6oIp4goHlSKLBR97nWgNSOWBew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4lU+nuaFdmWzLS/Ce4ka+u/3slXzJYRL71FYBZCAExZZoT6HI
	A8Uz906Asa8/ymyzEYMYnGy2pPnhy1nii+9/gWI8Jjbr+LTY2mGsPE0XgzgJmQ==
X-Gm-Gg: ASbGncsw8QvSke1RvjSoWrOGoxXqvyAT1XifI/ogVCoaPEEXuYTmRaOxE1HDjdNTmsu
	g4Zqaw8zNfojuAcT/FvGl6sN45epb3XNO60cEbD/sqM3jrgbCmT6rv3GoXuG3Ad66BgFxvH4l+s
	kWhGTKcEs7NjdhlYkpBwS3cKaAMf8sWGyG854PH6am2NTRh8/e0C9bqPL8/ywczXqW7z2lO3Eje
	Sr3u7A5Sx3HWc/MEXiZFC9ejUsR7P25kDtdEs7/nR2VHhM8C9ZzMiyp0rDU/0NdkE4n97CAYWh5
	Dt3o2K6Vz2fcvDJeIZLNWzH8ivFshruIi7qEda6pjCMRxa5DkaBlqAz07YzkFGAL0Il9sQGvHDl
	WqRfIafhoS1I4h74ohlhq26pnmygIvzFK
X-Google-Smtp-Source: AGHT+IHef74nom+ELoom0lADVTCoVjWhPLP1BEyC3csZHK36zDpwc7vILMBEnxkgb1pVFxMxGbrb8w==
X-Received: by 2002:a17:902:ce89:b0:25c:5747:4491 with SMTP id d9443c01a7336-25d26c4ab81mr99312055ad.46.1757811800323;
        Sat, 13 Sep 2025 18:03:20 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81bf:abc:6590:f690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2609445f906sm33275305ad.65.2025.09.13.18.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 18:03:19 -0700 (PDT)
Date: Sat, 13 Sep 2025 18:03:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>
Subject: Re: [PATCH v3 03/11] Input: add INPUT_PROP_HAPTIC_TOUCHPAD
Message-ID: <h43gwyrhmyftfzhyylexxujt2w6roa6dcvd3flei2owstk5f7k@qaix7m36aahu>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-3-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-support-forcepads-v3-3-e4f9ab0add84@google.com>

On Mon, Aug 18, 2025 at 11:08:44PM +0000, Jonathan Denose wrote:
> From: Angela Czubak <aczubak@google.com>
> 
> INPUT_PROP_HAPTIC_TOUCHPAD property is to be set for a device with simple
> haptic capabilities.
> 
> Signed-off-by: Angela Czubak <aczubak@google.com>
> Co-developed-by: Jonathan Denose <jdenose@google.com>
> Signed-off-by: Jonathan Denose <jdenose@google.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
