Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF7439AD3B
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786398163; cv=none; b=ort/ANFuBhJPw+b62Olp7E87uJxxo+8ZsqyD+/HJnNgOdeNDD3Ouw4wPGh2X9TPq7Wxo+HsxeJp9WHkbTGwI5gJnYg8RZujwvzOazpjA9dZ/u7VlbeCEo7jF5b/JZmtT71fwz86YAvWDv8StSR+ti1VxG62+5N80U/fRyZTzzt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786398163; c=relaxed/simple;
	bh=8hpE9nsljlM6tmO4jy65/s0BrzX0SxrerfQOPk9V8zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPxjyzVObTMtwGgRK9FhkO7LV/LGvBPDcSOxnp3O+Vhg2xNMF1lZO9kAiZsdv63akyWtLKXe+r37KAV7QPbvl2Iw5T4euz9/8fYbdvuPmBMqMYLDUQDZTy3LwFkOpSIKHth2wkpUljm9ZHjfsc95IVgB03AdgjkbPqg1sBUKIeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YwL5cd2+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fYXNbl50; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YwL5cd2+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fYXNbl50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786398160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8hpE9nsljlM6tmO4jy65/s0BrzX0SxrerfQOPk9V8zg=;
	b=YwL5cd2+Td4Rt93hc0Sc8ftnERImiJOpXFxxOlzeKKYrYAaFv/pflaQBYsS3fd8CFvwkWv
	B+hgG/v5uBCevUe9CJRo1WDjLPMfTeAw6yXHC645YCorEN3n2YlIxrzjd3+xo5p4XIZWg/
	BWN8G1uqCG6KWhia6kpll213tTTrEPk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-p0sb9UfFPUijUISw1_YbUw-1; Mon, 10 Aug 2026 17:42:39 -0400
X-MC-Unique: p0sb9UfFPUijUISw1_YbUw-1
X-Mimecast-MFC-AGG-ID: p0sb9UfFPUijUISw1_YbUw_1786398158
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47fecbb7f88so1608828f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 14:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786398158; x=1787002958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8hpE9nsljlM6tmO4jy65/s0BrzX0SxrerfQOPk9V8zg=;
        b=fYXNbl50oqNrJ8iCOZtRoG+M7b+8yUt86BE1bTVG2EutC0Lo5sld2YSNOtpCWzBXsW
         Kww9KvTFd4LCRBii9ctxd3zPh5Sbks2+OlMwG6Sv/oE8sowdVWE7uRDv5JfkzDGmT0L0
         vwgszf9tnAhdSPYMxZucSfZeQMwY+pLm0A40KAlR+Uf7nz7wvRZrsXxNRZjvlS502rmp
         6w/44aeZ7uQdkHSrT4tb6AzbJ/ivX6GrIdhg9D61CN31UFzc/2v2SStydAMZZgmbq6VI
         U8MqaDP8SKtnSK4VHo42iaclPtn6/oUZhvWLF6sZDM0zJYsJNd3keSjKeLcRGMJ1ZwUX
         jtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786398158; x=1787002958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hpE9nsljlM6tmO4jy65/s0BrzX0SxrerfQOPk9V8zg=;
        b=bPuiCeqCGNYGmblz5PnNJS0JViss471Puw9vHHsAJu22C2km7EKYO90p+angzei33x
         5uhWbwqrRK7PHCnAeC4ehBl869m1gKwuZ9pJ1YW/fMppHJtC2Agx2haQPqq9Sy0pdMhz
         +I3CGhVhDrDPPtR+I80Cz1k0YjPzVr5ADC8F8U5eNimV5op7vKbOty19utpbCKryujoc
         Ipu9WvUZG7BliDud+5pRNck44VEJWH3S79TQy5pLMhLXVSfBGYKIJqi9+LMJmZR8oVxr
         aq2Y9pRqYK9/XDUlt78w+1CFDh45lD1kDqccpjzsMlnz7iRbnbI40RZOjbIeEbJcmUvD
         k1ig==
X-Forwarded-Encrypted: i=1; AHgh+RrDVcI5hfprgAW7/KGfrt1gQMk+ziyYIAwouF20E8e/j61vsswEDrXfAAmdoKI8b6WFq3HQXQPy5Tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YylA9zS9tW0cHOx5hon8vZ2miM56SApDxOPNRqlnLU6TEBV3PvT
	halWSygH4MYkTgB+r9n98x45JDVQSb5wrTF3lhKCOkBpXohAa+61C9k+xaWfvE1suxQi0u+C2VS
	I5FwynnBZggWCeqVst9/G/6LzlFrwthMMt+IMRUD0uJ9lI6SxeCmzvkENHmgz5Q==
X-Gm-Gg: AR+sD10P94OljqjmXCJsVRTI3pt3kmOxXVz3PdMLpzPw7LZiSrAXsmgGMqrp/SZME2a
	8NDWsPq68j4MhPuhut+FAtzl+JfRKtBKh0lOY8LCnK/lPSnBm/IwEN/93FNGF1df90TjC8SPt21
	9bgoRFfGEERY/ayz15aMKxaaZrteb1INZ0GCQQC8+F7SGRsKaqVajBoFupwrZ/otuSYIzI5p0XJ
	I4ShddEiSDLL866b7EtgpxLDCGPlZesBm3ejTivpb5B4HDLmYpZVMfl3BaCRKHUgsXNeRjZrDIp
	CPJiYmQ1T2COSaanxO8qSCroBAPHkNxZgBgJudS1Szh85ahZ7D/9cSB7T4Wb7xoNKLPP9xqNzwy
	iowYJgstIQE0pyPoDmZPG+Q==
X-Received: by 2002:a05:600c:46cc:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-49961b8a027mr260735275e9.15.1786398157967;
        Mon, 10 Aug 2026 14:42:37 -0700 (PDT)
X-Received: by 2002:a05:600c:46cc:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-49961b8a027mr260735045e9.15.1786398157508;
        Mon, 10 Aug 2026 14:42:37 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-39-98.inter.net.il. [80.230.39.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49974170572sm17781805e9.15.2026.08.10.14.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:42:36 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:42:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Graf (AWS), Alexander" <graf@amazon.de>
Cc: Jason Wang <jasowangio@gmail.com>, Alex Williamson <alex@shazbot.org>,
	David Airlie <airlied@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Feng Liu <feliu@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>, Jens Axboe <axboe@kernel.dk>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nh-open-source@amazon.com" <nh-open-source@amazon.com>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Yishai Hadas <yishaih@nvidia.com>
Subject: Re: [RFC PATCH 00/12] virtio: support devices that own their
 virtqueue memory
Message-ID: <20260810162924-mutt-send-email-mst@kernel.org>
References: <20260809182010.32931-1-graf@amazon.com>
 <20260810021450-mutt-send-email-mst@kernel.org>
 <c56fb4d0-33ef-4e9b-ac18-ac4e896957cd@amazon.com>
 <20260810035246-mutt-send-email-mst@kernel.org>
 <bdcec878-d627-4d0f-a97c-35e596363b20@amazon.de>
 <21714074-dc1e-4ef3-a515-6602bd19f055@amazon.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21714074-dc1e-4ef3-a515-6602bd19f055@amazon.de>

On Mon, Aug 10, 2026 at 07:14:09PM +0000, Graf (AWS), Alexander wrote:
> Maybe I'm missing the real point you're trying to make? :)

At least one point is not to have text like "intepret every address as
an offset" in the spec and actually make it an address.

