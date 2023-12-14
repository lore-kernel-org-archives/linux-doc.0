Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BbzfstFd"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B553D6F
	for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 07:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702566792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jQ79FmjjPCNVzAGPAHYNPxV+2uxiGR+nSxB6va4aTn8=;
	b=BbzfstFdmBz6tqVHvz+6GXmpQxEg7AAFlzrK/HzkcjKXTyjOx/San3/jvp/KjzPiv0JL2B
	aKvugdsNz2WwSJhMb46as1yD2xFh5tG5actnG7dRCWhPqOSPdCQEuM/YWP3+MCYpDzM87I
	Sd4k6284AaplzjzrOv1HPm1ctwvGtCw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-z1m1O0QJNpSL3h8qzJZ6dw-1; Thu, 14 Dec 2023 10:13:09 -0500
X-MC-Unique: z1m1O0QJNpSL3h8qzJZ6dw-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-5caf61210e3so91757317b3.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 07:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566789; x=1703171589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQ79FmjjPCNVzAGPAHYNPxV+2uxiGR+nSxB6va4aTn8=;
        b=m0M81IoQ6uqk1QJ/EuCh9UZXc3twilq4WzhzWS3GUlsO7mn+Afvj4bcEz0l24joVXz
         9gKxDzY6V7oXWx7J5mmHZ0kv5bSIptIISFQxPYtPM6dy+ERrI/WYFOBysUwqkyDba19o
         yL3Q2zavrevdnz8n8UxCpVGmcdwOed4goatvy9ilzALDlJNNVVAaEg0K2W/2z5hiIgmG
         bT1E/f7vaLXx+mpzJhs93nT5DjxGLtgP/ikWFvhQ73nmFOP9NdnJjyymHDHSNhqgerbt
         ujat9BwrN9JLEz56V0qEogYUP22XLYUyG8eaq3aGnzKOc+Jep+8mtNyWQtJq9t9umy3F
         p3gA==
X-Gm-Message-State: AOJu0YwEyWnpcqqhPYxOumHMdrG6RnEuRoohjcCEkBUizEu0Zjyc1SoE
	jTZ6pRBdoFqKRYC6Uo0kMITAKRSYGYlv/cP10sgXWVG42lgrJAGIf7IbZI4SMei6eLmQ0NLd9y1
	Rt7FwMH7nH7C7fYFlq2McKWpGwysvf1bdfW4f
X-Received: by 2002:a0d:cb8f:0:b0:5e2:82ec:7156 with SMTP id n137-20020a0dcb8f000000b005e282ec7156mr2962181ywd.32.1702566789438;
        Thu, 14 Dec 2023 07:13:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQqCaLl5i21W9CMh7N2+Rl07zELQZVVb3jyU44JbeSmdxS4TaPEXVTBQW+5PMhV7xSxwEnbHW9iEqmOJArgLc=
X-Received: by 2002:a0d:cb8f:0:b0:5e2:82ec:7156 with SMTP id
 n137-20020a0dcb8f000000b005e282ec7156mr2962173ywd.32.1702566789201; Thu, 14
 Dec 2023 07:13:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213224146.94560-1-donald.hunter@gmail.com> <20231213224146.94560-9-donald.hunter@gmail.com>
In-Reply-To: <20231213224146.94560-9-donald.hunter@gmail.com>
From: Donald Hunter <donald.hunter@redhat.com>
Date: Thu, 14 Dec 2023 15:12:58 +0000
Message-ID: <CAAf2ycnV-z8EWM=QBgJFgjVsE_AfeoJqZEqP_woW8Q9OmnHd8A@mail.gmail.com>
Subject: Re: [PATCH net-next v4 08/13] doc/netlink/specs: Add a spec for tc
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Jacob Keller <jacob.e.keller@intel.com>, Breno Leitao <leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Dec 2023 at 22:42, Donald Hunter <donald.hunter@gmail.com> wrote:
>
> This is a work-in-progress spec for tc that covers:
>  - most of the qdiscs
>  - the flower classifier
>  - new, del, get for qdisc, chain, class and filter
>
> Notable omissions:
>  - most of the stats attrs are left as binary blobs
>  - notifications are not yet implemented
>
> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>

Based on the "ovs: remove fixed header fields from attrs" patch from
Jakub, I should do the same here before the tc spec gets merged.

I will respin with the fixed header fields removed from the tc op attrs.

Cheers,
Donald.

