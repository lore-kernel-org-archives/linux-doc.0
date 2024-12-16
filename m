Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625C5207E03
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 18:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734372093; cv=none; b=VZVFPnZDJZ1yuIpb3AmSGFYUSNmhdYkf8PEq5pP56fKnArqcRQ9H0iHeNmTW6jJcHk41OPqvJlR+5OJY+YqCtS3ZpCJc44TiQDYACZLvfxAH621F7dObpY3GUJ9s/aZW9SFlGCLzURoQoGSU04ctadisH323euB3BHpE4dVqD6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734372093; c=relaxed/simple;
	bh=TNfva8Q6ky3jlZGdUL9mgkSi6s0mbMUSjYqQPTb44Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxCpRriuociaYVygm3zJTomi7oZVxg/cPDbIvgOm2WkQVLqIVMrul8Y0b7iEQBYjDaLmFT02he1xpE2wVqEoDnH5zq5oe8dtm2tJwLegmmV8TGfz/Qx6iG21HSzx80+jSVjYwuFJbl1awUpyErckynfIimzS+93qBoJDks32SUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c0/1MESJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c0/1MESJ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163affd184so3615ad.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 10:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734372091; x=1734976891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iPQIIei43g7kqpTU4ih+SdwtTSlvo9YRppIwW8lHav4=;
        b=c0/1MESJ3NsGsL/fzy/xuxkxSU6G+3YdheqhAiPu5YNGqpxIb1dKePPN8/jQCkSSAt
         /otMdqMsdjXuEMGrRs7FKRTYCPMFQk1/clGbU/1a5kUgMldTp2WvuFmKDb3e3UkC7LiQ
         2xkvP4ddt/lpJ0Gi7f6sLv4Dw4sel6YURXrNqk9aHlCdlKuG1TsDc/aywVh0kj6374gM
         RIWPk3ELKukwJjBfqVklMW18IlaxuKlOEkKczwqLz8S3Nd/cMcVR6uPHqbL29QR4dYk+
         ObIjHgRWDuXYRMX/gOy1FYqic9VlKyC7wT5Trt5AX9wZBxsjs49uc7DHFbGJjd2ZW3O9
         RNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734372091; x=1734976891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPQIIei43g7kqpTU4ih+SdwtTSlvo9YRppIwW8lHav4=;
        b=CFCS1qkSOXoL45AqwAo7L+5bGBSmX4deJ4S0Tj0n3N2keFq1Wo/CKVbOruc/ynUrjN
         k9CFWz8zg/uI2aDWqdjtFyuqY1HLmgcI7zQGHRBFjiD4qTo8bxywdLeaVFoAR7KamDyy
         6LtLNoJOAZN7j9xURJVuhp/7JZRk3n8BRPQzqZ0I86yfIQfbaXGJjOg0LOXXkKD6+T2L
         e1jm51DqlI57PVIQS9yM7Q6o0jL63EjmXJboJI3dwtmtrbLpneietNCJIzbbib0Snoh5
         ASKwo2NFdc+xgcfGBgZtb0PZpvXjVzDnxkzx0IjAWvhf8+ZXmQ58/m7DcgssoMJ777zG
         DkLg==
X-Forwarded-Encrypted: i=1; AJvYcCXttd66OVTbs3mKixJ32Ojp0GvDMN1tsW9hzt08JvQvKq2Df1tSqzfiBEAeewThp1fVEj7jLSJJqbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlu1wI/rGHslUZ/a8ALFld/Yl52RM9TEIIzuxyloazCoTbB/1V
	jhEjs9dP7+41sFbITPBUWy+pWkw4nz4fPBcRW0dXDvw8BcArwOjE3DbsW+9pIQ==
X-Gm-Gg: ASbGncsFiHDyCYlxNdr0hg9Eq4DVoojOQfdZ1MQRTk/HeX4LgrX5vDXPZ6hMdJqUzq+
	QZajVZ7Kkht0k5spsnn1QT8DVrItz6rDoKHUfqWZYsyKoQDu5HzYGiSU8cOgpSvfWs6Ya+GmZJF
	rjYvdYTNM4gE16AajCPwsw57HxVoUG90TL10D5NRYin4O5fPq72Eb96pUA0MyV1/MJjl141hdF6
	tDzdX1jaC79scNFFOwFi8/OkYvmJuLeZYJqXxcq/+4McDaNzduoH8RTInIRSJIzfXAAXCIHg9aa
	qlqjpmdtKKRaS26jQcE=
X-Google-Smtp-Source: AGHT+IHHEXazswLI1ZC1yYlfJKsVFipOtHWE0V0uoBs6pGbMlIW0+1tuLPmPdqqn8TQk9Mo751rpqQ==
X-Received: by 2002:a17:903:1252:b0:216:6ecd:8950 with SMTP id d9443c01a7336-218a4539480mr4010465ad.19.1734372091319;
        Mon, 16 Dec 2024 10:01:31 -0800 (PST)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db87c9sm45727125ad.8.2024.12.16.10.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 10:01:30 -0800 (PST)
Date: Mon, 16 Dec 2024 18:01:24 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Li Li <dualli@chromium.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	donald.hunter@gmail.com, gregkh@linuxfoundation.org,
	arve@android.com, tkjos@android.com, maco@android.com,
	joel@joelfernandes.org, brauner@kernel.org, surenb@google.com,
	arnd@arndb.de, masahiroy@kernel.org, bagasdotme@gmail.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, netdev@vger.kernel.org,
	hridya@google.com, smoreland@google.com, kernel-team@android.com
Subject: Re: [PATCH net-next v10 1/2] binderfs: add new binder devices to
 binder_devices
Message-ID: <Z2Bq9CjXO6FXIFjl@google.com>
References: <20241212224114.888373-1-dualli@chromium.org>
 <20241212224114.888373-2-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212224114.888373-2-dualli@chromium.org>

On Thu, Dec 12, 2024 at 02:41:13PM -0800, Li Li wrote:
> From: Li Li <dualli@google.com>
> 
> When binderfs is not enabled, the binder driver parses the kernel
> config to create all binder devices. All of the new binder devices
> are stored in the list binder_devices.
> 
> When binderfs is enabled, the binder driver creates new binder devices
> dynamically when userspace applications call BINDER_CTL_ADD ioctl. But
> the devices created in this way are not stored in the same list.
> 
> This patch fixes that.
> 
> Signed-off-by: Li Li <dualli@google.com>
> ---
>  drivers/android/binder.c          | 5 +++++
>  drivers/android/binder_internal.h | 8 ++++++++
>  drivers/android/binderfs.c        | 2 ++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index ef353ca13c35..0a16acd29653 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -6928,6 +6928,11 @@ const struct binder_debugfs_entry binder_debugfs_entries[] = {
>  	{} /* terminator */
>  };
>  
> +void binder_add_device(struct binder_device *device)
> +{
> +	hlist_add_head(&device->hlist, &binder_devices);
> +}
> +
>  static int __init init_binder_device(const char *name)
>  {
>  	int ret;
> diff --git a/drivers/android/binder_internal.h b/drivers/android/binder_internal.h

nit: I believe you the following hunk should be in this patch no?

 /**
  * struct binder_device - information about a binder device node
- * @hlist:          list of binder devices (only used for devices requested via
- *                  CONFIG_ANDROID_BINDER_DEVICES)
+ * @hlist:          list of binder devices
  * @miscdev:        information about a binder character device node
  * @context:        binder context information
  * @binderfs_inode: This is the inode of the root dentry of the super block


> index f8d6be682f23..1f21ad3963b1 100644
> --- a/drivers/android/binder_internal.h
> +++ b/drivers/android/binder_internal.h
> @@ -582,4 +582,12 @@ struct binder_object {
>  	};
>  };
>  
> +/**
> + * Add a binder device to binder_devices
> + * @device: the new binder device to add to the global list
> + *
> + * Not reentrant as the list is not protected by any locks
> + */
> +void binder_add_device(struct binder_device *device);
> +
>  #endif /* _LINUX_BINDER_INTERNAL_H */
> diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
> index ad1fa7abc323..bc6bae76ccaf 100644
> --- a/drivers/android/binderfs.c
> +++ b/drivers/android/binderfs.c
> @@ -207,6 +207,8 @@ static int binderfs_binder_device_create(struct inode *ref_inode,
>  	fsnotify_create(root->d_inode, dentry);
>  	inode_unlock(d_inode(root));
>  
> +	binder_add_device(device);
> +
>  	return 0;
>  
>  err:
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 


Other than the comment above it LGTM. Feel free to add:

Acked-by: Carlos Llamas <cmllamas@google.com>

