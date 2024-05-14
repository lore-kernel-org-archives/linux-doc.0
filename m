Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B7F180A6C
	for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 21:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715721666; cv=none; b=ktjavsg6BQI1icBaU/YM8111WbvNGx2PY1VN0fFkT4LWwtiLyjhKJxmccxdwAz9Qnc+J0CGL58ELpS4ShGTO3hHc1e8hZNkzEnByNRbf0tNeERJbUzkEzbghS6K8aEXHEZTc6kPOLKEeFICf3XA/mfWZp9eaZTcN5crIBttsU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715721666; c=relaxed/simple;
	bh=CwPBPu20Q373SE94/2W5Gs5lJ3zjrSanPFx9uYehg0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ku0nmLNwLjSmiFx+LR4C4hseb3RkSHTGfQiMJjVQvziTLQPOcEh5D9UtyDNuEO9HvAgBkjbEL15zrJTSoTdgNoMvFjpgxYJ+zd5prJZdXihjX9XP7SE9wLKugxuBjRD6HZDs4zJuOqZZ4KnQhJubZ1yqXX+jMQRrzwHWpEDaaSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4dVJGaV6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4dVJGaV6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41fef5dda72so238015e9.1
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 14:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715721661; x=1716326461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CwPBPu20Q373SE94/2W5Gs5lJ3zjrSanPFx9uYehg0M=;
        b=4dVJGaV6gbT/74k+v2vX01UiSQm5+J3cdbUp13Ajx0HY0QhCG10FRaeB59efSxCcJ1
         ChieX2dM1//AptnKX2SoKrrwFi3SEGKNX9MSsqenII5v0oOa620JgsQUXoDmcuiyQnXy
         hr1Rl2+sLGwGG2wEQR6DO08/KWVlowi/1Zbp0Qg8hzBGNfc4sTGGeFfJfdvW3L2XxRoR
         j14DfxP24Ef7V5us8d76+nvzFUQdfN6ujqkeACuyTMgmKh7EelBZhgdCw8Co+2YkN9Wu
         V7PpdbLVNRxjKXFyT/Xl5vcgOzDTYO8adtyi/p2vG1KEYOQiJWV/Mq5VemKkz4XRi9YH
         /cdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715721661; x=1716326461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwPBPu20Q373SE94/2W5Gs5lJ3zjrSanPFx9uYehg0M=;
        b=ak4e3nPQXksR4AeWZxSyGenrBtHJh78QWdwqbwKamLEyNfgjaj4eqLCTOkXNqLU9/K
         AWwW90tdcruQs1IPP+93QZsrCh4V9Ow3/SBm00g2FBWTqYW11XIWAGIRsgvkCrbXgW1v
         P5kZBbZsCpYmvlD/zTpFIuJUOXF+gY/SRggngSABEVri131B4P9v4Ss0muLTc2G4BY0o
         oRmquqNA2baY/PBM0GcbPY2C10sTdQMD+r2o/6KGSVgXzNxRt8wYx874fb7ED90hr5kM
         Jpbzv8hfzQoJa3sz6q7uQ7EcoYEwpjCoLFvdoU58jsIlXF7+GOjxWxBngmV9IK8BKQsI
         UZkw==
X-Forwarded-Encrypted: i=1; AJvYcCW8BoSXjpRMkWlUxiPy/08Wo4FHUANMCSi4Ltc+g1x8ABOHSAFXuYE7wSi1PMpPrfrSqzwk6RLrf9fiI4fo2PkHSTNheWWuYAmA
X-Gm-Message-State: AOJu0Yyfz8dlLS5rT1oHiqgmqokVMgRUP9fSUL8s3iHRNChVyv+JFgqp
	u+9fBZsAnFUuWeVnEaA6D44UoC4ry10cnQAaKN3WSaHQTmTtK0Sv/y5luFagRw==
X-Google-Smtp-Source: AGHT+IFK25M0wgeXLfHIqwddgM4kRtbQlKmkMGa4V1C30HfAGSGO4wDqOPGaTUCXpXxxKks9YftHWQ==
X-Received: by 2002:a05:600c:1e12:b0:419:b16:9c14 with SMTP id 5b1f17b1804b1-4200f8697eemr7227225e9.1.1715721660799;
        Tue, 14 May 2024 14:21:00 -0700 (PDT)
Received: from google.com (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fd491c712sm117556485e9.0.2024.05.14.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 14:21:00 -0700 (PDT)
Date: Tue, 14 May 2024 21:20:55 +0000
From: Brendan Jackman <jackmanb@google.com>
To: Daniel Latypov <dlatypov@google.com>, corbet@lwn.net
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Brendan Higgins <brendan.higgins@linux.dev>, davidgow@google.com,
	rmoar@google.com, corbet@lwn.net
Subject: Re: [PATCH v2] Documentation: kunit: Clarify test filter format
Message-ID: <ZkPVt9wyu7f-fC3c@google.com>
References: <20240402125109.1251232-1-jackmanb@google.com>
 <CAGS_qxpBmmafnQnDXYf5RftPzxghd+i8Ly4CK=EkcpidpCPP6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGS_qxpBmmafnQnDXYf5RftPzxghd+i8Ly4CK=EkcpidpCPP6g@mail.gmail.com>

On Wed, Apr 03, 2024 at 02:59:43PM -0700, Daniel Latypov wrote:
> Reviewed-by: Daniel Latypov <dlatypov@google.com>

Hi Jonathan, I think this is ready to be applied?

Thanks,
Brendan
