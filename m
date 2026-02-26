Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFA6371065
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 05:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772083576; cv=none; b=P3e9RTxOPZtnyxN1lqJTYLjIZaDvKqm/0wXktTSclAhq4g2QFSdMpn6WEz5br7FN14pkMDPFTHmNJIVsfc+jV7OzXa3p62eCYS8FtA2FwbNnn+asZYFvPbiriysH0CA/56kXDkWZcMXr8TM7VvOvjxQyTE/zWGvUtkLvqTAg2og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772083576; c=relaxed/simple;
	bh=VPz3ZYgXEY2hzDLAW14PxLbQU9fmN9eElQW3U4jKlCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRYTq9BZhxCccfNqLVqc+IBu5KISpUHjnKgo2RqXyt5/EJpE++9JxYQg+jIFdH3m6hKwUXJ6FC6Ldqa4TrX55BLQKcXsIWRIrsi6EDFcQfMmZAqCd0lJL2GsjFYg1fuf9MdLutaEfI4bfltnAeQH9LvakdwkUB8LN4HdkfEQew8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WA1ychK0; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WA1ychK0"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c70c112cb61so269645a12.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 21:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772083575; x=1772688375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T7mgaU6rPDLyUHIg9CRAJuNpAGqmGXby8vxxfzwZ5sc=;
        b=WA1ychK0K33GayUwW/PQjIUk+vjhj2MIk+QC9QGKi+lMv1GIl8GkAxozlMweBqCRQV
         DpljkwYH6dATNJAS5k/1jQFtZJrwxAQqgLSv2/DtymNB4reG0T9yRxJAAaeX7wRxd1NS
         V4gGmvMi33xS9JxXuPHk++pfxw739e1FZ07JKFEXUnqaPtcozgKHvKCWSl8IhLxgkDL7
         qAisy25aLQhivuqrUTMj7lSpfQNoyxlO0d2QJkqdTzTuQb2h+c/6OqtkCAY7bC9kwD+h
         wQcvJZxUXEqfQPcrFmIiIekwAVNGXhRxdmvRSdouoKpAqwpGA0Vp6H0DAraxuHEEQyJR
         7fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772083575; x=1772688375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7mgaU6rPDLyUHIg9CRAJuNpAGqmGXby8vxxfzwZ5sc=;
        b=KW9zRWFvV6TLVEfZw1YfY2QpVtzaAYw/f+Vb6yWTDoxurY+MixMLUSkCbhenhB1XEP
         0p8WhJYJxXyGe0sJEQuld6y0en0b0L6gOh5+PPW1c7x0U+OgpthyL6qTj2mgPMNxva9n
         8XECovCsJxpQ5P6XPpjmORigF9lky87oZkZO3VDC3c6IgHdi4ZBvgOW1pHBdlL7IQN1e
         9KGY5eUxOLd5d9RekyBANm41oK6/vAFozDAXNfpNMPB6VH+4rvH1MaXRojgBswPsbK1t
         Z8K282U/0ZHRBcnWYceqzdKEOWqjaCoTjOueeTWaw8SfzxWiN36Lqmkpu1FxjW9k9XEX
         QEvg==
X-Forwarded-Encrypted: i=1; AJvYcCUdUNm8axhG6h+m4alIHQCz5ySG6eDYv1JCFMqdnVYF5PEX5TYHyHS03lhHn+ZohGP518/AAbxR+bU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2IZ/3aPcy5y6L8DkmSwZCX6hTdTWaePM549jjvAvYjWnsqd3t
	0EgUmoOGIbaXhqlzvfL6FTho87KUCbkHvOGZQz40oNUppgPGK/NsGuHW
X-Gm-Gg: ATEYQzxCcyaiqGfOVQNEMeDfA/c/B5FsWfK+eTqxmuX9ih8GRZMWw5I45IsxKIj71k9
	XgDmADOQolgsr9KRUgAfXg8DQcEwqbeFuppMWt1V3SDlTniRTKvHXHeyyLRpkl7825YSlAgqg1Q
	DWpvleCYKHEHv8dVtRpf0nZ+zd7+PH2GN3EkJFowX7EI+hOcET/sbRPSSChG+kbvDZD1GTgpjfk
	EYRpmdTLadxKMpo4iWUjgHgg12LFvx3rbUnNTXyQOOBvivV9qJaGCe3SiiKKJCSZboym6P4Ianp
	pnwvRW2M7FMtvL2OBonltHD7kSkHub/o17DpfowcP5v5A7J8KefoMol6vOWz2ww66v+oEe9V0qY
	QgNO/8VYtzUjjE2pN6Z0sRHlvc6JnTDMWOu7Ze8LqHpMSiNx/f5+cUaD5xlL7xQwljcyaASYq2C
	dqIgMdS7bIR7hi6w==
X-Received: by 2002:a05:6a21:510:b0:38d:edd4:2fc6 with SMTP id adf61e73a8af0-395b49a35a9mr1154639637.70.1772083575103;
        Wed, 25 Feb 2026 21:26:15 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5e4abcsm663045a12.5.2026.02.25.21.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 21:26:14 -0800 (PST)
Date: Thu, 26 Feb 2026 14:26:12 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
	linux-fsdevel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] ntfs: repair docum. malformed table
Message-ID: <aZ_ZdKZ1ZHpCHcH8@hyunchul-PC02>
References: <20260226020615.495490-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260226020615.495490-1-rdunlap@infradead.org>

On Wed, Feb 25, 2026 at 06:06:15PM -0800, Randy Dunlap wrote:
> Make the top and bottom borders be that same length to
> avoid a documentation build error:
> 
> Documentation/filesystems/ntfs.rst:159: ERROR: Malformed table.
> Bottom border or header rule does not match top border.
> 
> (top)
> ======================= ===================================================
> (bottom)
> ======================= ==================================================
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Looks good to me. Thanks for the patch, Randy.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Hyunchul Lee <hyc.lee@gmail.com>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> 
>  Documentation/filesystems/ntfs.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20260225.orig/Documentation/filesystems/ntfs.rst
> +++ linux-next-20260225/Documentation/filesystems/ntfs.rst
> @@ -39,7 +39,7 @@ Supported mount options
>  
>  The NTFS driver supports the following mount options:
>  
> -======================= ===================================================
> +======================= ====================================================
>  iocharset=name          Character set to use for converting between
>                          the encoding is used for user visible filename and
>                          16 bit Unicode characters.
> @@ -156,4 +156,4 @@ windows_names=<BOOL>    Refuse creation/
>  discard=<BOOL>          Issue block device discard for clusters freed on
>                          file deletion/truncation to inform underlying
>                          storage.
> -======================= ==================================================
> +======================= ====================================================

-- 
Thanks,
Hyunchul
