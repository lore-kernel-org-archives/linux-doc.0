Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42E61946BC
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 19:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736451055; cv=none; b=o9cNje/aELhZgHUKXI2xnfBeGIqhLxM6+4PgWYEPDr/2U4jGWFvcMjiYQlh35TEcuijxuU5MigXGN2ofLQnJJLFEhEyUp0ennWnzrl2s37pKQtiGJILpxDErBSWddXKU0OcrFJsEHO9XgxnRZb16wxlraug+6tsCkFc+mkVHJd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736451055; c=relaxed/simple;
	bh=Jhtvix7xSu3NnLP8KBl8g422PKpvaIRqarLc6lutKPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNkBjdf+QKclUdqMcPD3/DUSHrrl0i6LCYC4BvB0Xod74zgWTykymzNekNf/vfaGx0K4QTdlQUisSgba+8RgL8iqk3ewPMECr0LPuJwFroexgwlD9W8nM6FkG/twvqHCiCgKSCTQCqONY7ViqIlTxikJaAfp3GLaydjGIBYdEgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vJHrkX/L; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vJHrkX/L"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163affd184so19425ad.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 11:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736451053; x=1737055853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G4oGp2x/UCnR+jaxZ+9JKVEatLAse5UBIsi8oCs7U7Y=;
        b=vJHrkX/LtKXoWq7Zqx2PleHUF/UMMO0UwiUGd/4ZJcltI+ERfUFRQ/fzLAZktEbvT+
         GU3D3dxr3re3G6oGz7PivFZiIKxyOAGS5/ZaSNUEUlIFS5EpzJawdk0EyzmqZHjz81A9
         hAR4pJ+0qO/7xRgR+PLFguefPMsT+jdTiD/xLusZqo4Tlj8DM6DbjNdEszc4fuQkHG5C
         nTdxNtr2CqUaLfBdMMRqsdFQ+kR/xFLq1Us79G9NVwhTrazeW9PfT2fdv+EXgFlGQx99
         pN37x9oS7Ddjhi29gE/lLl6exkzC86R0DuPdx0mqIjPKyeIrozZ4n28rnw1ZScwfGuzt
         EqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736451053; x=1737055853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4oGp2x/UCnR+jaxZ+9JKVEatLAse5UBIsi8oCs7U7Y=;
        b=JrU+XKuofJn6xZx+AOQcF+0EtttBpobNmouILz3qeiRKEGcfZBhVdhJ00bYHRPrqdS
         MOVV12nECNq+yNRFy94k2gS74fZF0aFiWGB7RxRzgOuaKnfl7y2FtLJkfepE1QefwEvj
         Rr03ZVKiZjcrHRgT94U/syPC9K0ZytUZfiknLLDUWppKA/tSy9NNCvmjkb2P46Unwugm
         DgmoUV7XcCv+I0IdB77y6irGH3jJBWKg7NPXpiC1NpP8qNCm+nqPoF9eFLtZJcuiFR2s
         1WJKnrnNbKCUpD6I51Gjrcu2LbF3QDDhqvfLxp3Ng+Us9bTRVTPOpkpiJi8jM3Ir33qz
         xYnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYWYQDh+Cala+YPqU4becdKWj5AOqcWfrBiH8JSZdJoYy/zxRjRsjunG/0vIc/xsBop8L/GAOV6rw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0QJHhoXBYRY73VevZtnZgsny0Ge3D5vxH98RUD5iIAl4PYaVZ
	jFRzhAs4Iq/XWDo70+QBzhj/mZidLP71PmMhk3PGJf2lHgIltQ0ff+PMAWRUbw==
X-Gm-Gg: ASbGnctA1MeHCeZvLD3UgKzq924f2LxCb1Qze7dX2SREIvoHC8zau5vb5wREgtSAQ0F
	wJxH1L4rtMwOWXihUHK2S7bL9HcE2kDa9BnaTD0m9cgCvaOz/jFcznHfL44g1L7M60YRrocD0TG
	HEMZPBiTelmLSZAsCZxYOxgaO4AaEzNStjQSDHiKCGGVVEEXMhbCij5nSABxrrWihg8I8cYDaku
	C7q75FRfyPmoQ+NQf6VO1Pn9ZWBJb3my7SNezBXdJqezNMIZ4b5aeAWDZUeTt5DTcbe0HwoGD1/
	RwY81EpY/dj7zsqrpWY=
X-Google-Smtp-Source: AGHT+IFzCNaUMLZQpS69edpNe2wTv3yaxb8Nr5prG24P/7W0nGcPA5P5+q8wd2dZxn6wPzbERuUARA==
X-Received: by 2002:a17:902:74ca:b0:21a:5501:9d3 with SMTP id d9443c01a7336-21aa0a7e7a5mr123485ad.21.1736451052856;
        Thu, 09 Jan 2025 11:30:52 -0800 (PST)
Received: from google.com (57.145.233.35.bc.googleusercontent.com. [35.233.145.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f5594512f0sm1827201a91.36.2025.01.09.11.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 11:30:52 -0800 (PST)
Date: Thu, 9 Jan 2025 19:30:48 +0000
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
Subject: Re: [PATCH v11 2/2] binder: report txn errors via generic netlink
Message-ID: <Z4Aj6KqkQGHXAQLK@google.com>
References: <20241218203740.4081865-1-dualli@chromium.org>
 <20241218203740.4081865-3-dualli@chromium.org>
 <Z32cpF4tkP5hUbgv@google.com>
 <Z32fhN6yq673YwmO@google.com>
 <CANBPYPi6O827JiJjEhL_QUztNXHSZA9iVSyzuXPNNgZdOzGk=Q@mail.gmail.com>
 <Z4Aaz4F_oS-rJ4ij@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4Aaz4F_oS-rJ4ij@google.com>

On Thu, Jan 09, 2025 at 06:51:59PM +0000, Carlos Llamas wrote:
> Did you happen to look into netlink_register_notifier()? That seems like
> an option to keep the device vs netlink socket interface from mixing up.
> I believe we could check for NETLINK_URELEASE events and do the cleanup
> then. I'll do a quick try.

Yeah, this quick prototype worked for me. Although I haven't looked at
the api details closely.

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 536be42c531e..fa2146cf02a7 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
+static int binder_netlink_notify(struct notifier_block *nb,
+	+	+	+	 unsigned long action,
+	+	+	+	 void *data)
+{
+	struct netlink_notify *n = data;
+	struct binder_device *device;
+
+	if (action != NETLINK_URELEASE)
+	+	return NOTIFY_DONE;
+
+	hlist_for_each_entry(device, &binder_devices, hlist) {
+	+	if (device->context.report_portid == n->portid)
+	+	+	pr_info("%s: socket released\n", __func__);
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block binder_netlink_notifier = {
+	.notifier_call = binder_netlink_notify,
+};
+
 static int __init binder_init(void)
 {
+	int ret;
@@ -7244,6 +7259,8 @@ static int __init binder_init(void)
+	+	goto err_init_binder_device_failed;
+	}

+	netlink_register_notifier(&binder_netlink_notifier);
+
+	return ret;

 err_init_binder_device_failed:


With that change we get notified when the socket that registered the
report exits:

  root@debian:~# ./binder-netlink
  report setup complete!
  ^C[   63.682485] binder: binder_netlink_notify: socket released


I don't know if this would be the preferred approach to "install" a
notification callback with a netlink socket but it works. wdyt?

--
Carlos Llamas
