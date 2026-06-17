Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2709B3B27D8
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 06:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781676624; cv=none; b=PzZ2yV1iFn5xufj+ElOx6bhcVHMdcuZ1/UFEnVrEeI7+ocXXxjCIqgjZjR9AiJ5hVqxFS8dL5hhlgDuVTNniSIO1VesMhXEiLfEaLKbCOd1/yMzlj9xa3Evn8OB6p3AXpbwYQBHqFdJgCU4RMF1t+9VTroe96I63D35umPYrBB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781676624; c=relaxed/simple;
	bh=J1GaUtDu0lV/aN08T7cW6eB+bMo+zoBDOYe/2JHOaAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iul5k2KVbfVtXHfpCejkV5k6qT7SqfIkicVUROAVG0MK/pjJ65t6Ax09vbID90ucCIj/514ih5JmzGXh7PSl0e5a/3lmuQpnWIS1McQGZf4KkZgg9+bGjsotfAoxMqF87PSsWLIvdZsEf+PuIQGjSi8q/mP5aZAfIZiEm4DsZek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D7y5i/qt; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D7y5i/qt"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8424b6792efso2277084b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 23:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781676621; x=1782281421; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00zCxIJF6+oPAz4r/V9ZifNMpH6SjkiBAAesMrF/bTI=;
        b=D7y5i/qtOJsTxWHh9RXt+2JIsQm0kcvGBjhqY1+C5fOECxgVXMIojQCC/U+wAwBP7d
         7Y+EQlN/b3KfJ0X2y7KOPMo8m7XJyAleepJpfrcJLHMVoX2VpTshZ6PqhlM0EiK9oPOZ
         4cUlssh8ZOrIcxZb8Q2+Sh8wRTJneUJHAOs5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781676621; x=1782281421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00zCxIJF6+oPAz4r/V9ZifNMpH6SjkiBAAesMrF/bTI=;
        b=m1Df1UUbgYDZgjDsrXAEBotBwKpw1HAyEjiV/H1bxid1woFncyJcR48WORPvnJGqvM
         W5A772+zGVxjiiT/muYN49mP+GAFAFT38+yx2yYuw8u9Ibh8vGmfuHOPia4E/+JyYrOK
         PZsiFSq5b/fRCOmaKv+Co3G95ku1m45czyYCGnXqdsGuRuUNMuA/e5O1ymutpkyYr94b
         XEiGYPE/Cm0giSFB0jqIbK8D508WN2yMjGoXL5lsmWLHeYNQlJnmIbE39RGRmAsnlA+A
         Pl5KWiFU14lH3Z8bX9Fizpa2jk9xvb+LDK7kqlbJ1jz8H1BycU1dvnvcHTIiYoibGLl0
         nuZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8HOztUiHzPpG5EidoJicIe9H33WxxhieQguH2xLI65EiJfRHsG2ZTHxettAjpBh9KaguDEvV1AGx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJzXlpOcOODt0z1H4bPgpCOylRAnxRgih/m6sQUUrKPhVhUlyn
	JTEGwCT9vJqTKvsPbjbbz9GsvjCJKCF/qpFnWxbFKEac71kFrVb/jDhzRyZ7iHyc5w==
X-Gm-Gg: Acq92OEEb5+QV5/Z+4hwFQUlTJGQW9XFm/Wp49gnKGdI0ddQSgRpfSTLt+rQbQNBrfD
	Ew0LI70mSRToNoHffdMVImmVkMYCMnK6M13VohbbukVegbxJUXgtKffU3BHU1m7gs1ef1oOzCP1
	bvo5+CPuYVVOsxsRO4RljBjkIj4gGSlLqopBIkw6gRMYFUICqM2EbxKoJKCgD3kNY8fxf8QcEC5
	U2CQOFmF6pLZEtrHSKArE1vmGaGizh41luw9WLxl4RKcpfbxdvGnt/pkcUDLKyYnstmVzc2pinm
	JCMy4afpmXZ9uFY845dp0JJ6ufrbNAGPTjOlsEnIk3IxXBgn0XnY9DbB0XtI/ktXdHysI7+e3W/
	7VMf2geAErfziH/AdGCS9ov16d06oqhNto78/qqTUg+hkEH7Rk5BJZOJV7uAR18mel1JgLoTMCV
	DrhWA9NQOGpZiANe+T/VMYyvwUvO5RqAgvU76k7IsLfXq7Yjek0gr8
X-Received: by 2002:a05:6a00:2906:b0:835:6388:655d with SMTP id d2e1a72fcca58-8452445abfamr2457086b3a.14.1781676621348;
        Tue, 16 Jun 2026 23:10:21 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:20ef:efdb:f2c9:836f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b020b53sm14338791b3a.47.2026.06.16.23.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:10:20 -0700 (PDT)
Date: Wed, 17 Jun 2026 15:10:15 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jianyue Wu <wujianyue000@gmail.com>, Christoph Hellwig <hch@lst.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, Baoquan He <bhe@redhat.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Youngjun Park <youngjun.park@lge.com>, 
	Minchan Kim <minchan@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
	Brian Geffon <bgeffon@google.com>
Subject: Re: [PATCH 0/3] mm/zram: route block swap I/O through swap_ops
Message-ID: <ajI52zahhZIY0kir@google.com>
References: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
 <20260616123646.GB21024@lst.de>
 <CAJxJ_jhK+zkpjhs3YsQ9RoasKYh+E0NweQci0sPAEY1ne5LmBA@mail.gmail.com>
 <ajIYFtADxQDq8q1P@google.com>
 <CAJxJ_jiM_-a52EOm896FXkdH+wRxjSHJx+MW6b-ewNLVkp4uSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJxJ_jiM_-a52EOm896FXkdH+wRxjSHJx+MW6b-ewNLVkp4uSw@mail.gmail.com>

Hi,

On (26/06/17 13:44), Jianyue Wu wrote:
> Hello Sergey,
> 
> On Wed, Jun 17, 2026 at 11:46 AM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> > Can we elaborate on zram being a "legacy interface"?
> My previous wording was ambiguous. Actually I didn't mean it is a
> legacy interface.

Oh, your wording wasn't ambiguous.  I simply forgot to direct my
previous email to Christoph.
