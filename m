Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4399F1DD0C8
	for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2024 14:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124054; cv=none; b=bhRyrsAxjCp5q20ygZvc2BFIWGWVn++eUKfIP9+GPL9m+dOXntXLHrI9J/RZyKZX0pPNHVNjSjw0tkNGfTrkajDc+Ij4ZkkDxREg5nhrqYxd2HCk51Yn9wgJS6h/WwXWx1btnkZUe+9UDlckg0gdNU/pRe8I85t0vHBOjYsiT18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124054; c=relaxed/simple;
	bh=Ew7uv1Ej9gxdNQJgHdVVARFS6iEQx+F+aZ8qXNu4Ti0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bX2pSuvvvXuLKht6JKXUpZa3ljoASo5K2LStzCdfvZ6QJBPW1XT+PQZnNoigHGNf872LDGj9KTDPf++06yZl0Wl1GN9YyOY8tGkiCMqYoaKJuF/7pkQ+yWrRVDjZTuo6hADPAwO9K7KbSQ3/Kz2CqPNp2E3r9iJZ5FQ1TIjvygY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=VtOhGLFt; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="VtOhGLFt"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5ebc0dbc566so2302187eaf.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2024 07:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1730124050; x=1730728850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5CyyWAppIMSemT0CuK62Hzyft+OY6WztWx8opHDh7Gk=;
        b=VtOhGLFtMRINgCVX/MFbzoAWe/kNK7gsR+YtXeb7ibCI3qfQPXBfnw8go6Otz+5C9/
         FaKvsdwrUKETyIE06QSa/6ojAKM+TmqFq9WBw9ADBLdMyPxEtDr+ieb5PR1p9RL1XTTj
         1zQELN6mahRrknLnJiY1oXkJ91IICjMk7iiVgBA3sICGEmmCdi7r8IF42aOxLME/M8tY
         GBIk0xXxbyWuvA9IMX6uQD5LyOqM8fWEUx7OOefeseDwcf1+sW6pZWAAxQzytNmZk6DK
         vwqO7LDNNrvrw+Z5fhTkDc2HNRf6NWqYXNEK2+ilNxMtu17Wo+k5OCYNDCl6eP7kAdp2
         0XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124050; x=1730728850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CyyWAppIMSemT0CuK62Hzyft+OY6WztWx8opHDh7Gk=;
        b=QkHLK6IMOwsPwoaqIx3rpMrI7QH2aqY1Y7Wm6nb999iCywa5tFiySI4cNixUVd+iM0
         AKFQY8n1dLbmYSLDoxOjH1kHump1bTOegVzjI7OX6jBvDCFEMDt49We9SYALPpjLcWd/
         aT9nCnvHikMWYojuRcjUKoaW52iKtkNnYGEFewJuuasYya8ly/uGrGhegOMGRVIf4/Tv
         kR/3gvdSSnvzk+GOXBJ2A0VqUlcGKGmVhuWLmlBGT7RsedgAavQwWQEyPWJuRLui4y0f
         N/FT8mKrlphbxLJH2cX9bqMK3NbcWFhYqHM/FI2bcnvzXiBlA3tgn0vzBK0H1vbJKmZj
         P/zw==
X-Forwarded-Encrypted: i=1; AJvYcCVd7I7solby6nWMdUJofrvjcmJr6zwrsrrbk7p2dXw+/HGJBmZO2w2D1NiYN8hZOwV6/ICXYJLVt8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyK+4uuPH+QixqfeqU80FoIRmucwr932paxp+035cAJLRSKXo0
	8zH5qicAizdK8bnC8KAfilKVh8Q43sTJ7PHdZZuZMmSdPW8CQU7TGSicG1O1/bQ=
X-Google-Smtp-Source: AGHT+IGBtH1NdyVtTtxosvWgimQBcEYOE5uA1gln4dVd1rWRKzOv+q6qmhcV6IpETFtUChiH4J473A==
X-Received: by 2002:a05:6358:e4a9:b0:1b8:6074:b53 with SMTP id e5c5f4694b2df-1c3f9e18e55mr223282755d.10.1730124050180;
        Mon, 28 Oct 2024 07:00:50 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d295ebasm318533385a.50.2024.10.28.07.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:00:48 -0700 (PDT)
Date: Mon, 28 Oct 2024 10:00:47 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH v1 4/6] memcg-v1: no need for memcg locking for writeback
 tracking
Message-ID: <20241028140047.GD10985@cmpxchg.org>
References: <20241025012304.2473312-1-shakeel.butt@linux.dev>
 <20241025012304.2473312-5-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025012304.2473312-5-shakeel.butt@linux.dev>

On Thu, Oct 24, 2024 at 06:23:01PM -0700, Shakeel Butt wrote:
> During the era of memcg charge migration, the kernel has to be make sure
> that the writeback stat updates do not race with the charge migration.
> Otherwise it might update the writeback stats of the wrong memcg. Now
> with the memcg charge migration deprecated, there is no more race for
> writeback stat updates and the previous locking can be removed.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
