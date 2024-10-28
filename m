Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0993C1D63DF
	for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2024 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730123703; cv=none; b=FcF+v0iLQ20DFejTSao80wjh0c00+EXoPOi+0ppZgltSBzHqW94hoj+dJ4WzH0rQbxIUGqAoaMokEl/lyLdz1h3dOpNS/qVVYz54tkX8TZ8ozirYdSQjpxcNWeVJVe0CnLV9YP75l4tTYkJx7NsnBcy0NHAwzqhdcpzH0+3ftrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730123703; c=relaxed/simple;
	bh=qL02jNM6QmkzSbt2ixQNsK3JzmKMePb8iL5x5oQAhv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTxAW9JndtOCZpOlRHxpVcu7PfxsCqscOF65SdGW72B6TSSS/OCIhw2YNl7bRk4e3wuL0motaJFHhFhpsJK68PIDavFJyXCX72NurE/2E0wjDEOWvsS70I2WlUQkWbw7EE6LRSqEoh/SdI/RZsvdQCiwoVuvKghYr+YDdV0eGe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=VqeQRIaf; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="VqeQRIaf"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-460ab1bc2aeso27728221cf.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2024 06:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1730123700; x=1730728500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XdtW+9c27laTcra3rAzShsDaFJHdIeIenw692lRPhns=;
        b=VqeQRIaffq4EvXZks2ytrJaf97/g6QwUiOjEuIvJEErEjcr+rE1wAihHKj42i7IXjT
         cKN35Rto5W06O00htQJTcgOsq9vMjlcigDhgnNNWtzGtHkbGT01/tLMZH9JECoGBZv1z
         0+oGJ1iGBQ5TPbGFAymYT2qXBB6TqpPMLyAjYhoohvpDH/9FeVGy8vFjk3Wfw8/82Bx+
         8JLXg7gm2atdlb7qDjGFPrIk+l8melaxCAJJBQ1JXdhfTqUbx91ck4ZacHSNQy5tPkXf
         nW4b3rDG6NBFFJl9mZXejGtuVOmHuwluhoRkT7Vrtup4t6rGvUXM8w9eQOaeHFe3Y2Hl
         /YfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730123700; x=1730728500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdtW+9c27laTcra3rAzShsDaFJHdIeIenw692lRPhns=;
        b=an5ghKNx47Hm6O34H82rJXJHkNbnrsZ+W5AgNL51xMB9c/UMAqzYhKg2XNjZMziSe5
         WUo7B++Gx7CvCbE0MkgqlM/JFKmznWf4o3SPROirMxX2o7eYLrZnW6/O8N8q6AD+q5tE
         L9Vqo/y3jKbEkolvMVeqEtr5Ajzue9c9ol5ofbZjcA6OyfRL5k0OzuCeut7SB+G0IHfB
         Y4zZ0JyBm9yCGli70o2ZZ3b3HcT53+CFVjWPADFR1JrHhdSLRw+ZGdPVUO4WTfNJqk5t
         l3XtnDvIiAlVANTCbm6dzXDetltDCrjbh/tdN1gvsCcr0NUe4Bpm9IQXFne0mansu1ag
         8GEw==
X-Forwarded-Encrypted: i=1; AJvYcCUCwuVK54vDZEcVjgxL4if7PP1EeIODZ9Zsn/JMwOLwf46MmKp2GgGS2Ry1F8MhbpkRJq9R+jbrWKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp4mdWbDHWeOImeAF8V88vfvE4nJNAbS4aJlT4UT5YB7OqiDow
	0BPOXrws9SQ07CuIj+9Zagc6yFhRoUdBWYXssg6/oMwwKAOHy/Lbtq0ThXhZaQM=
X-Google-Smtp-Source: AGHT+IGbX3q3h5Rj5AEwNGKx4zq0zvgm4jApVpmYWXOD0GBg1g5E9PSQsj0MoWVji8f6oOFjZAjUlA==
X-Received: by 2002:a05:622a:341:b0:460:adce:bfe9 with SMTP id d75a77b69052e-4613bfdc4b6mr141463971cf.4.1730123699937;
        Mon, 28 Oct 2024 06:54:59 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4613214d426sm34785721cf.36.2024.10.28.06.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 06:54:59 -0700 (PDT)
Date: Mon, 28 Oct 2024 09:54:58 -0400
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
	Meta kernel team <kernel-team@meta.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v1 2/6] memcg-v1: remove charge move code
Message-ID: <20241028135458.GB10985@cmpxchg.org>
References: <20241025012304.2473312-1-shakeel.butt@linux.dev>
 <20241025012304.2473312-3-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025012304.2473312-3-shakeel.butt@linux.dev>

On Thu, Oct 24, 2024 at 06:22:59PM -0700, Shakeel Butt wrote:
> The memcg-v1 charge move feature has been deprecated completely and
> let's remove the relevant code as well.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Reviewed-by: Roman Gushchin <roman.gushchin@linux.dev>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
