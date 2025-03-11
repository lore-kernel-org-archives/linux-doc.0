Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C319C1E9B22
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 03:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741664255; cv=none; b=cbkE5l84Db1Vwfu8VQPQEuijdVj/MpHQUzbPhH9wI81g6DbiHpBNf9RxpRVXvGz3ofwsMbAAxrrIJXMR+z8KTU3lh1WgucBUtlgsSpXSUDCJ3iDKGLgYyJ3wjkLBWKy6Hx2hi9mwLYW9O4ex1fuOrm+epsivSdA+CKVPK6EqJNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741664255; c=relaxed/simple;
	bh=WJDiIpzPVyWLH5Cn8j/8u3aIFFtw49GPgJTMCyuAZFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/6hDgHdkRJP30MErHUm9uqC9y+oOiqp8s6Br5q+rH1G8FBl2+s7jAcWu0pg5jxkqMBmosmxW5NKExK84+sEgdyhvUypdYqOGr64c03VETCt40eXHJMxDdq49nVx2iAS3PcDr+GRLseH40oromTa5KOd67ThEgLuXujM9DvVECc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R7r49EIs; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R7r49EIs"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2242ac37caeso56755ad.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 20:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741664253; x=1742269053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GKKMXhARfXEwg2PwHrZN99nBi8+39p+oYTJh2YeoKoU=;
        b=R7r49EIsnN7h/+o3taKGdxwyS6LTzYjaMxZ6eza16XBSC7e6lyvhyA8SxT9yNJwZCL
         ftWf4Sl5oO02NYlDMk432YfL2hSTBPQg9mxtJIpy+La2kW2lWlCL8Et5hX9ZTbY5FbWn
         5Sq8E00Vxm/oi7Y1O2qGbbrOGWyJZ5WwnRcMrUPw4+qXnYmB5if25PpKz1Z+qDBRIX9Z
         N84QCsK+9ej17pCRz0y0IsncIfkw6T+yfgQBa+kwHPcSoWpYhtPOuItg38bzg4M0X/uW
         wN4SS73PPN1CbO+P86QekKiH32mdArq9zwiGjDt7sZoeLk97je+nUkNajlz2qVx/DqUG
         As8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741664253; x=1742269053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKKMXhARfXEwg2PwHrZN99nBi8+39p+oYTJh2YeoKoU=;
        b=XotffEAfNMetW5dezZhBhTixTBnsr+qJ8wkEaCwfYCHG6INHdETAgQGPDiPlBeiFYI
         qjosxGElXPl+hdWE33cV+wH4Cvr7fbpqpIVYicG/JsWyxZpjAX+o78mjL4BRlf0Imxq+
         z+UzMmHocgaCSz5gamO9pUwufnn0SHYAc5+0V9vwNyQma9Ts5gXlRVVcp1s25SDeREeb
         OWovIe90bK/E3U8I045Zg/nu/4wPjg4uekrBUFVK9uhwGbXkY5jyuE1GvGHitB3hiDBY
         KPVvie68n3/UgMZ37/SaN/VnwpaobchJwixBtNXe+rKkNkwVGoU7cJTvmsb6G4TaeLim
         QZNA==
X-Forwarded-Encrypted: i=1; AJvYcCWpL103KnjdVYcpnIEdb7QfhGBztBkZNGq0XW57w6z+2ktjDSDnhl5Kzuv/ndR7y2sUti9BkxsDIxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv8K9w2wOEBVp8cRBitrVbt5ySJ0U0cAgNig2or7idXm/ocmK5
	51AAmWtuH3Lv/84pNPc8GBN7aMkJOut7+8ZasTVFa4yEsEQ5755PFUPBuZODJA==
X-Gm-Gg: ASbGncuLvAsB9KhSpwUDT0nzCgecBA4xJOAsnZk4XG2u0x5jbqiGhoXwrs/hcwy0Lil
	YXw2mhIJf0HiRYWmn+KSMIx+0VZX926y33QURonsClwwlUfZF3FmR0K8OH0jgr0REHVJQ6SyRil
	NC5+uu9oE65KSGSMgNtsGiFBOHEyQ4x6Y6E3bgLuPV8p3YNAEaSfmbsRzT/B1BQ1TaJ8iNUJplW
	+tsIwPeWofmesMGcOZaWX8m0O/yXiwgJ1QzxpcLtVJbGtVi3x8809xL4FrEuljdUNLk4h9609wM
	5hsWDbwPHG+QRW7EIT6dCYV/IIJ6sy1O+JiUMN6R6fmSKZOjuLP9grKKtfxz2HL4XSSVgGKHXzl
	LoPpqlSk=
X-Google-Smtp-Source: AGHT+IEK91Z6kXFaIWJCVbtXPxgiAIU5QooJrJa6uX0FbecTFo4b+EzP9+Bxt6J46OcmUjrvYOGJvg==
X-Received: by 2002:a17:902:ecc4:b0:224:a93:704d with SMTP id d9443c01a7336-22540e584dbmr6561245ad.2.1741664252755;
        Mon, 10 Mar 2025 20:37:32 -0700 (PDT)
Received: from google.com (57.145.233.35.bc.googleusercontent.com. [35.233.145.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e789340sm10752115a91.26.2025.03.10.20.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 20:37:32 -0700 (PDT)
Date: Tue, 11 Mar 2025 03:37:27 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Li Li <dualli@chromium.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	donald.hunter@gmail.com, gregkh@linuxfoundation.org,
	arve@android.com, tkjos@android.com, maco@android.com,
	joel@joelfernandes.org, brauner@kernel.org, surenb@google.com,
	omosnace@redhat.com, shuah@kernel.org, arnd@arndb.de,
	masahiroy@kernel.org, bagasdotme@gmail.com, horms@kernel.org,
	tweek@google.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, netdev@vger.kernel.org,
	selinux@vger.kernel.org, hridya@google.com, smoreland@google.com,
	ynaffit@google.com, kernel-team@android.com
Subject: Re: [PATCH v16 3/3] binder: generic netlink binder_features flag
Message-ID: <Z8-v92gIPgrxWq1w@google.com>
References: <20250303200212.3294679-1-dualli@chromium.org>
 <20250303200212.3294679-4-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303200212.3294679-4-dualli@chromium.org>

On Mon, Mar 03, 2025 at 12:02:12PM -0800, Li Li wrote:
> From: Li Li <dualli@google.com>
> 
> Add a flag to binder_features to indicate that the generic netlink
> feature is available.
> 
> Signed-off-by: Li Li <dualli@google.com>
> ---

The implementation looks correct. However, the feature you are adding is
not "generic_netlink", maybe "transaction_report" or something similar?
Future features might use this same interface so lets avoid confusion.

Thanks,
