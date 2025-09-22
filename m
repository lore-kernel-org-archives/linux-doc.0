Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAD93054C7
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758544459; cv=none; b=m3ekG+I2Meej8ZmW02AeQ/AoAAklY2JpY5SXzVe6Lb1yXHs0C4JL8HGz7E5jnAdLH2lBNROBTfaghtKb+qErKYsg3DwCeO7IImbK3WX+DxD8o2qVgwrb+S6ntfPmC1JS2mOhuNkPGpy8jbFEsM5KYharZsJ/jLp3bp5m1u9umLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758544459; c=relaxed/simple;
	bh=vbd/dIVFJeMuDWZGTwJ4IGGTJIynPy2T9UsNctLcg+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXNuWVBx6HmdYzIMCbRrnk6uvyFrKiiARsGSOQ7p97bs2bncMABRs6uX/jaS0SVpWorgPH7RKBG9xWFsQ73eEYXixcGdhMy5XtYQE9XF8w8vkGlrIz2yEe7bw9hDrWFTPqMr5HNDQc5iF1vOy7NiVuTyoujeE7lyIjdI9xztO9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkq+RnKT; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkq+RnKT"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77f41f819ebso536658b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 05:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758544458; x=1759149258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V7N/A/nDdO81iETqklo4zlY9UTRGuYMbbXYZaKO6LOQ=;
        b=nkq+RnKTOX1QmxxtADvxvCnTCHZgGC3811KoxN9P+SI4O3VqEoFXndehbJLEysxtsW
         0sRGXlCprFdcJNLLqZb2vDlw9S7q6SJcrBMugM+oCINdELZYG/yUYG5KZ2hY4h2JniVL
         ZLloidt+MuZI4y9xHQkiNG+kl+RshIS8MMORc+ZWMzW1JaQW0WrEDlfUgB3p4O+zhwjZ
         0i6GMnwUwRW39of/TGxzNa7y8SmqQq/zvc2jdQ21Y/VDFdHxXOLYgVTWRpRQzVtC7/91
         pgXkukd9RtKJcHRiI53qnTmig13KuKBRlx50gTcWh+dgDI7P2rfqRDgS0R+k2li+yjS6
         56Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758544458; x=1759149258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7N/A/nDdO81iETqklo4zlY9UTRGuYMbbXYZaKO6LOQ=;
        b=b+cHtblq/7+fUqwdQcs62yu3FYt599ovfa1oAmL21CoVMPy8XbdjQo1SolZ/TpG8Fk
         2lRezGlrxdYALxEG36Open3Nv2+Q5ihtSOQre6zmrfBFteC3YJcyIApkhkQguAJ4PTW/
         yqJqqQ1cpYWPh4s+biSgkH+RfLAJts3YqxVY58T4eni9YXTm+vEUA+/6hFBvHbHBrn4a
         fqOJ5YUNjFvRWKm6K2CffgNc5YpBrxQi94Gpu8KDyt6GxZPJX3Nq1TAxtXFbIQmWui5S
         1KMmqO7Jq4KfwrYU++4L0Yr33HWzbSGtW/POxuFsdLsBYJcsKDQo9lz+9kpyraHLdksq
         1l4w==
X-Forwarded-Encrypted: i=1; AJvYcCXRDmKX0Q4YX00Z91/qUcSnc31N3Vx80w/wsEvx4N3rrD20QkpsmGL0exVcvailCidUbyMcoVio6Zc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/N0NctqtBgug2BpweZLkXVyFtgmqY4bNdRIK+B7vf3lrzemHz
	IoPoJnupd4J8LtWpSwVgKkw/2Lk6+j9hp2hPoGPx3tsgCGm5IcsI5Igm
X-Gm-Gg: ASbGncsN7sHVZvZQ9KAlrm8Ib7Kc7MEuBD0jCWcASOuG+BWnGri4cx84TbYIfL7UBJr
	LN1zBYp19JwktpBhKaMMtIHsFH+H2MlFXA19TbV0+oo1a4D15UXs3XIPFHjWZ0W0ZZH4KLnSIrM
	A6xcZiIjitqh+eIq/FDAOBgGTVvTOy4fUz8sNBjCdGjrvgYgmnPBZf87YyGyJsM1QGupYcindbm
	v7PBCSbPPBEu1JV3A6DtE/zAFKtU9mthnoKIEqjxX3T0344FdWdaPk4khnRhRcdoNbxjH2RGG2t
	+hao7YAgPwELbIKu8kRL45D9lzGGO2yCHR2wUy2ZWXn5ZAdadHsqFjNIBJxZoMRsQ0HkZi5o3V9
	KGGcuhy7DB4fUbeINyQnLQg==
X-Google-Smtp-Source: AGHT+IHdWuuU//PjNYXcYLakegZtFFcQb6zpKh1LJyLgmx6iYUCqAqcadaDUiwNWxci1/ojb7D6lFg==
X-Received: by 2002:a05:6a00:3c91:b0:776:1f45:9044 with SMTP id d2e1a72fcca58-77e49f0742fmr14342835b3a.0.1758544457581;
        Mon, 22 Sep 2025 05:34:17 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f363ed5a0sm3251366b3a.41.2025.09.22.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 05:34:16 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 606834220596; Mon, 22 Sep 2025 19:34:13 +0700 (WIB)
Date: Mon, 22 Sep 2025 19:34:13 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.og>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux AFS <linux-afs@lists.infradead.org>
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: Re: [PATCH net-next] Documentation: rxrpc: Demote three sections
Message-ID: <aNFCRVGajxlZjjxa@archie.me>
References: <20250922100253.39130-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250922100253.39130-1-bagasdotme@gmail.com>

On Mon, Sep 22, 2025 at 05:02:53PM +0700, Bagas Sanjaya wrote:
> Three sections ("Socket Options", "Security", and "Example Client Usage")
> use title headings, which increase number of entries in the networking
> docs toctree by three, and also make the rest of sections headed under
> "Example Client Usage".
> 
> Demote these sections back to section headings.

Oops, I misspelled LKML address. I'll resend shortly.

Thanks.

-- 
pw-bot: changes-requested
