Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4421EF087
	for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729784539; cv=none; b=bMSiNPJYmsUoF5EVWRHFuBzPqP95ZIqYPbTaxkMe2lk1H0HCS/Zkz/ZvaO/wTKVxnVF0lvr0RyNmG0596qCGASXUZri1c78GHvJwFJGQJrEaGOpckCmyY9gPUaPfrHd4oK/qc8okJTabcgQdb52h8vN9SjdGqygK1bNFBoDhhH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729784539; c=relaxed/simple;
	bh=JA2+P8tJNRooSWGy8dttNYXnIOGobkf1Mu8CVP6xBNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebryQ17YYo8/xqbYLU8BfWooD/LuTkLM4GViTgwOZ0Y10TIVd/qC6bpoCPr9ZeiuHYBGjSQpKHfDSnAFrLSiHZl8i4r50ZlvIRSDSNB/ZwnC8zpEN7hqmCHPZOYOLZKha8wLQGZ/Nk8XXEzMKC6QZFcllh5VxofWKIm3GC6Cblg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QX3aUza7; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QX3aUza7"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e2e6a1042dso797645a91.2
        for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 08:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729784537; x=1730389337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B8DyuvHzb5XjyqaoJeydh5dQ8YB6zbnvlTgF+dM7WRk=;
        b=QX3aUza778sGgaBvXlYHMNU2/eCriMFlaKP8H9NT356wKk4AgpVK7E9msrXuvWzYqX
         L852GevA6j7ExqD4faj/ELspE4LY2RriwZIacUq7Qx+6+uTbg08kfJBcZcNXM32q0Gc8
         5BRgiyTecTWo3ueVYmURQkxKs7C33mVPZglctvVzUdMtxND88Daggylt4mwCaRYX2+NP
         MlKA8VnNFvG8ogccTSSKrYjKl7KSgNhBlpMC2TGfQdKbpczr0mMWoItjHeqcqG20mE1W
         7GpjhUuKwxoOE/JQAvWKj1uTP5mol0tvEofRQKo4/wz2kPLAupp/PN2nb5JLMjDMGAyy
         rYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729784537; x=1730389337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8DyuvHzb5XjyqaoJeydh5dQ8YB6zbnvlTgF+dM7WRk=;
        b=bUj+9PcuX/WSlJZVVr3OGqtInIJcZ5mCYORgvDjoB32X+2y5JdRWnkitgr7Nw8Ymsf
         hWTJCcskrn7dn86Xso9yNdIhLFbPemf6KOm88AV7lkHJ8GM/VAt/PCpjMihg7BmTN8p7
         JOhCNRozLjsYYRc2ghQvCVej8IJa/j324vIT/8hpdDbsG6x83KgnRqm3eEHijpgnnD72
         Sqm0ajIv9Rc80P4uCUmmtgOZ2ryP1oz+4sT1gevnrwLqMDvVWPDDfdF2buMT6pKZYZ2+
         VQWTb4OGed79NEJp+9FXxHx2t+6BHEiJ8Ao1rRnnme4vWN/5Y70sTWkMEp9hlBwtvpBh
         jwOw==
X-Forwarded-Encrypted: i=1; AJvYcCV0Tt1OqIbRGAxcrMfCB0D30S+Vi8vhluYOwZNeNUdckfOofZZY/ni8rJ1gJV0Wrg0VHVFbay1PXBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YykmXEOYwWGzalWkwuDU98cp41Z1ZiM8lF6c3IKSFITQCGldxXT
	sAiNXYw/h9y/+mfbMrVkoa0MQRWLRPVTLiLp2i78OOJTeqLIPGyHJRQPOS3MsihaZoxhzLUO/a3
	I
X-Google-Smtp-Source: AGHT+IHJA6h9/dphvA6EaRPdgKXiQXjJSKFpmG3omjCNL1LDYLu7ZLPUnH48dmdvoBjDXaoFRYpMOQ==
X-Received: by 2002:a17:90a:604c:b0:2e2:e6bf:cd64 with SMTP id 98e67ed59e1d1-2e76b5b6be5mr6956529a91.5.1729784536954;
        Thu, 24 Oct 2024 08:42:16 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7c96:e131:bee8:c8a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e5bc59bsm1638536a91.56.2024.10.24.08.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 08:42:16 -0700 (PDT)
Date: Thu, 24 Oct 2024 09:42:13 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: anish kumar <yesanishhere@gmail.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, corbet@lwn.net,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 1/7] Remoteproc: Documentation: add the main index
Message-ID: <Zxpq1RGltdWiE5sA@p14s>
References: <20241023053357.5261-1-yesanishhere@gmail.com>
 <20241023053357.5261-2-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023053357.5261-2-yesanishhere@gmail.com>

On Tue, Oct 22, 2024 at 10:33:51PM -0700, anish kumar wrote:
> In prepration of moving the remoteproc documentation
> from staging to mainline and also for enhancing
> the documentation.
> 
> Signed-off-by: anish kumar <yesanishhere@gmail.com>
> ---
>  Documentation/driver-api/index.rst            |  1 +
>  Documentation/driver-api/remoteproc/index.rst | 20 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 Documentation/driver-api/remoteproc/index.rst
> 
> diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
> index c57c609ad2eb..ec9d669b92e5 100644
> --- a/Documentation/driver-api/index.rst
> +++ b/Documentation/driver-api/index.rst
> @@ -30,6 +30,7 @@ available subsections can be seen below.
>     frame-buffer
>     regulator
>     reset
> +   remoteproc/index

This patch doesn't apply to rproc-next and I'm pretty sure it is the same for
Jonathan's tree. 

>     iio/index
>     input
>     usb/index
> diff --git a/Documentation/driver-api/remoteproc/index.rst b/Documentation/driver-api/remoteproc/index.rst
> new file mode 100644
> index 000000000000..8b8c8f512e2b
> --- /dev/null
> +++ b/Documentation/driver-api/remoteproc/index.rst
> @@ -0,0 +1,20 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +========================================================================
> +remoteproc - remote processor subsystem in Linux(TM) kernel
> +========================================================================
> +
> +Authors:
> +	- anish kumar  <yesanishhere@gmail.com>
> +
> +   remote processor subsystem is a way to manage the lifecycle of
> +   a subsytem that is external to the Linux. The remoteproc framework

... external to the Linux kernel.

> +   allows different platforms/architectures to control (power on,
> +   load firmware, power off) those remote processors while abstracting
> +   the hardware differences, so the entire driver doesn't need to be
> +   duplicated.
> +
> +Mailing List
> +------------
> +To post a message, send an email to
> +linux-remoteproc@vger.kernel.org
> -- 
> 2.39.3 (Apple Git-146)
> 
