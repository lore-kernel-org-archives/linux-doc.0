Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB1A10942
	for <linux-doc@vger.kernel.org>; Mon,  4 Aug 2025 06:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754287228; cv=none; b=cXc7M8mdJxe5PXzmxtnR9zGQ1WnMkQLGao0fp1ngXTD+5/6av8JT2s3yUUOh7jbMQVfUxGKHaZhDkRpuu1tI4Ck4gGNsA6tzJX8jBxgzsdBYtgu7r9UwdbT4L69JS0hGtUloYcmnNRKk0gsWBSPZt30qo7/MTWesUe+/I6dR3+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754287228; c=relaxed/simple;
	bh=CMjSVsnlYIHATz4fXgWOQlWXjlcbst7J2k2mwNhi1Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjAzYMkjQ8DpZcdBbb6vKOPPAKxHo0BWowVdvchys4/CoxFUmtUVCPJlxNxvH1ofML5uaeTUwBAEeONyBZhkPrSnGu9rp/vFfz5MWjCgPgGr374C9Lc6s2/USwUZ9yHnzgNYaIAaF+E6ZSa4MOYv4dhFzyB8zBVBGdY4lj1+rjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TnWiv36G; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TnWiv36G"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24031a3e05cso27897035ad.1
        for <linux-doc@vger.kernel.org>; Sun, 03 Aug 2025 23:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754287227; x=1754892027; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GW9ee20vQhs+179oAZihQfxJ7e5GO7cvFv5OZiXPnJ8=;
        b=TnWiv36GJTMN+9LQBBxwj5Xn6WHAy3zy4tIIwg0kjzdME24J3ZeIZAKReLxDuxNlDe
         E/p+rHScsM2OFr4c63KFFV5Qj17x/VKMMpichsnt8AVNW7jbBwhyp1jHLn+TJdQc509v
         AJ3tn+ZLtfDT/oTuBuyejYdGerDFADZYFOioNpK6pj2JDfaOGw4gE8YQJZ8pWBs9bdjT
         W1nJD6QElDxf++YghWNBM4/MlXvyMXuc1UvkCw1pBHDQMdYDcUhwg8RcCmrJ/9Ai/P83
         v4zN2+2BPKl+b4byb8fEdPt2uaTB9MpDUe5rmeIpuGu5PamWm89T+rgYVLnIMwS3xG8Y
         usdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754287227; x=1754892027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW9ee20vQhs+179oAZihQfxJ7e5GO7cvFv5OZiXPnJ8=;
        b=E+9Rmb7MhAjM1CQzSXWepHa44106gjPSaCfjc2gh6OETy50yRKilEt7hRLjxTKxrnV
         +9v7vj3q0NELlCcM4Rvk8QhxaK3GWhOVNiJbtuz3Ek6AebX37Z1y81vGiW8oCC/L9Txe
         Hb0zVAbpsGNFyokcj41Dguixz/SNsvP+LKqCDQIT/iolGz8DL4lq2mZPXQVa73ZmIXmU
         Lb3mQ2KHJe2nGPIgdQHdX6wadQQh6Db2PmrDvXY/bXLt3DlNPSTgba/X44rhrxRUYkSo
         jHT7/Vlg4mSjVRfZrZFN6A+bXtV9/BXea8hqhWhbAXf3Jk5kFqkfmRjTACcRfGyYoGhH
         EgDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoOFMVmrmeEmou/iR9861Aiioin5+N+nwQLOmItMreIDLTx0fo4BxVli4A3luwKAwqcOHSjvoPwpI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpvg96xYLXDcuUySfPUSux6ctyJOMIBvmdETxDWhm56sFiX6xd
	jS+Sfuez5DOa9v+He+9R7l8Df0LU2pekqD7+ujSOMU0YlDZFDQksBk6Ya6OlpXd+HvEXCJnHAtB
	vfcfaS/H7YqAM/9g9R0q60+EAkc0S3XPJlN162sSt
X-Gm-Gg: ASbGncuKhHJMOkGDqCdw0GWuw+sn/b7XRrgl6SfWirWrlB7cM1OuwYmsZC/kO9iRHkc
	xl5NyR6uR8T1sLIxGj3FWOctXnbudZshcoBGqCIJc8miuuFvG5L0+pv/VyQGGlinE2hHAv5pDq+
	A9wxxGfeF37vvIjIcxA/rX8TFWph92NznPzz5P2dxipkCh51uLRbXv4rvOxsnKp/jrlSOAW1fic
	O7+cq9JwF8mwqjh3L0ZCLqjU4M1bZIPjcQh5yQ=
X-Google-Smtp-Source: AGHT+IGjk2UIBetcSl3cOr+lPMFKsmxl+eJNheNEbJC3BP4ucecQ/KCFqsi7V58RFGF5MsVFqR2tEo7P/NgkM0Cjsno=
X-Received: by 2002:a17:902:8601:b0:23f:ed0f:8dd4 with SMTP id
 d9443c01a7336-24200d7d3a1mr165647385ad.23.1754287226255; Sun, 03 Aug 2025
 23:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANpmjNPWzJZrAFT3-013GJhksK0jkB6n0HmF+h0hdoQUwGuxfA@mail.gmail.com>
 <20250803180558.2967962-1-soham.bagchi@utah.edu>
In-Reply-To: <20250803180558.2967962-1-soham.bagchi@utah.edu>
From: Marco Elver <elver@google.com>
Date: Mon, 4 Aug 2025 08:00:00 +0200
X-Gm-Features: Ac12FXzqJppzOFmhwA4bjarsTDBlyoRY0yvvampHjfyILSAANQCwWK9R6F2pkOY
Message-ID: <CANpmjNNvsJ_u7ky+d1tiXtwc-T3z6VB4SiMqpo6aKWBBFO3ERA@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: load acquire coverage count in user-space code
To: Soham Bagchi <soham.bagchi@utah.edu>
Cc: akpm@linux-foundation.org, andreyknvl@gmail.com, arnd@arndb.de, 
	corbet@lwn.net, dvyukov@google.com, glider@google.com, 
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sohambagchi@outlook.com, tglx@linutronix.de, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 3 Aug 2025 at 20:06, Soham Bagchi <soham.bagchi@utah.edu> wrote:
>
> Updating the KCOV documentation to use a load-acquire
> operation for the first element of the shared memory
> buffer between kernel-space and user-space.
>
> The load-acquire pairs with the write memory barrier
> used in kcov_move_area()
>
> Signed-off-by: Soham Bagchi <soham.bagchi@utah.edu>

Reviewed-by: Marco Elver <elver@google.com>

> ---
>
> Changes in v2:

Btw, it is customary to send out the whole patch series on a version
bump, even if only one of the patches changed.
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#explicit-in-reply-to-headers

> - note for load-acquire shifted to block comment
>   in code rather than in the preceding paragraphs
> ---
>  Documentation/dev-tools/kcov.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
> index 6611434e2dd..40a4b500073 100644
> --- a/Documentation/dev-tools/kcov.rst
> +++ b/Documentation/dev-tools/kcov.rst
> @@ -361,7 +361,12 @@ local tasks spawned by the process and the global task that handles USB bus #1:
>          */
>         sleep(2);
>
> -       n = __atomic_load_n(&cover[0], __ATOMIC_RELAXED);
> +        /*
> +         * The load to the coverage count should be an acquire to pair with
> +         * pair with the corresponding write memory barrier (smp_wmb()) on
> +         * the kernel-side in kcov_move_area().
> +         */
> +       n = __atomic_load_n(&cover[0], __ATOMIC_ACQUIRE);
>         for (i = 0; i < n; i++)
>                 printf("0x%lx\n", cover[i + 1]);
>         if (ioctl(fd, KCOV_DISABLE, 0))
> --
> 2.34.1
>
