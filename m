Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1984C14BF92
	for <linux-doc@vger.kernel.org>; Thu,  1 Aug 2024 22:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722550351; cv=none; b=fKopQDqBZBKppggun/K8uyZ4SWF4j3PJT/YWamCpULyeoZfqp/NLN8be56C0SIBx7LoysPwisyW7WzbqhYMR+DQW9W4aUrz5qyoynvJ250sbgMMS4jxeTpr3gYYTKBjL3F86xu3scx31/MJOtEGTQplcccRHbTTdLnALNy4JWaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722550351; c=relaxed/simple;
	bh=0UTEUABwLl9nPHyasmA3Zw/bHjsSB/lUKnDNzfoDXeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlVBLPNAMUiwVL963ry0hfmMpucqROMmvjzXd2P0hgkVC6RxzYqk6QrAa9XKUjYVj6yPHQ9AzggTHzBg4J52sEBFtKF/VIm0VnnMT7of49yZ5FEygGAueP1zxbyEtLpzBzhLl28BLqA+UxX9q1dd0TRNCsuFlaDDDVWH9iq9AyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MWC2XevP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MWC2XevP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722550349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oEkakUjv0oShqAlgA+JoFFoT773rpEPOk5LHphGKBXA=;
	b=MWC2XevPWxNDw4qHj4RffqWocP21wC3ik63MipWViTP9C6o5TbEGIjsvw9iPXyxMX7AEca
	gtZbob4SnkGUsEMYy/IWagT1nwxgDzsdkVsfLv1/wWMGMI3dr3Xw8ZbumLyHzvZNUZqbFs
	nX0CCY97dfgrktqxacWmXQaz2w+U7Ww=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-qOn1K_FxORSo7BZ3WOcnBg-1; Thu, 01 Aug 2024 18:12:27 -0400
X-MC-Unique: qOn1K_FxORSo7BZ3WOcnBg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6b79ccc1504so12531406d6.3
        for <linux-doc@vger.kernel.org>; Thu, 01 Aug 2024 15:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722550347; x=1723155147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEkakUjv0oShqAlgA+JoFFoT773rpEPOk5LHphGKBXA=;
        b=XGo4cWEch3mpBITbHclLFWk3WYuh72V9oJZSZu4XgNt4zX/faSdVnni5o7yX1DyNJ2
         jo708+QLLp3YxgyUZBifoVrbWTkTp9Dg8yTGbs9RNk+d2Do6L/GjU/6V2X+oIq7WJaox
         egYzLL5NpFHXLGMNktQtbfqHsulxKdlzHII1u+Bl0bYPvsQwqU6LP6s4qXPUJzfSy/hu
         PvTaGHLr08vCRt+Ush/Xk6bwR4rENBFTPBE+9EuZNopLczwzR/MHHw3RQEP6J8F13UQ8
         ul6pF3wqR9/lt+Ueo7fS/3Cs2FHyU6Ycz/LqdiLgfEb9BvPM+BNAuexhI6HxXQvoNfUt
         bTbg==
X-Forwarded-Encrypted: i=1; AJvYcCUXVO3GWXjSU0FsFBPL7q07PiNTLfaqcN9AmCZ1fknpqjRdhUc82f53JCyqj4VXQWmE347Pf2QesYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUNzigW17MGf7YreDf7gP4CIAcM225lJJR3uoWgYbwyCO4/d+N
	re5qSzbzhn9vwvBrntuIqpW6hi5kMYX9qUekSvdX2UHWZ7eAGpdfcEQeE8Da81JxXB1cvpmxd0x
	OlcYfSw07Ci4YTr9JHxfcbNBLmANd5Z63CLKQYzyvmKQ+DL/7kt+BOkhg1Q==
X-Received: by 2002:a05:6214:c48:b0:6b7:586c:2cf9 with SMTP id 6a1803df08f44-6bb98477071mr10740546d6.8.1722550347295;
        Thu, 01 Aug 2024 15:12:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYiPlQnhQgnszBxOlYnmcmzkuBRtiLsO/YtZH3gTULjwGEVWYGXNe4E6cY2VjLct5v9IMvig==
X-Received: by 2002:a05:6214:c48:b0:6b7:586c:2cf9 with SMTP id 6a1803df08f44-6bb98477071mr10740356d6.8.1722550346938;
        Thu, 01 Aug 2024 15:12:26 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c77099asm1039296d6.12.2024.08.01.15.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 15:12:26 -0700 (PDT)
Date: Thu, 1 Aug 2024 18:12:23 -0400
From: Peter Xu <peterx@redhat.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	David Matlack <dmatlack@google.com>, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [RFC PATCH 00/18] KVM: Post-copy live migration for guest_memfd
Message-ID: <ZqwIR8HW0d0cXAhq@x1n>
References: <20240710234222.2333120-1-jthoughton@google.com>
 <CADrL8HUHRMwUPhr7jLLBgD9YLFAnVHc=N-C=8er-x6GUtV97pQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADrL8HUHRMwUPhr7jLLBgD9YLFAnVHc=N-C=8er-x6GUtV97pQ@mail.gmail.com>

On Wed, Jul 10, 2024 at 04:48:36PM -0700, James Houghton wrote:
> Ah, I put the wrong email for Peter! I'm so sorry!

So I have a pure (and even stupid) question to ask before the rest of
details.. it's pure question because I know little on guest_memfd,
especially on the future plans.

So.. Is there any chance guest_memfd can in the future provide 1G normal
(!CoCo) pages?  If yes, are these pages GUP-able, and mapp-able?

Thanks,

-- 
Peter Xu

