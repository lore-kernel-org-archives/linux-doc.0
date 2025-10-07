Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15101285CA4
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 18:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863324; cv=none; b=tZlvNJRFek5ePoCH9XYEOaC0tavwBBH/ZS+WJJkoY0kvTAkvtbZj5zCFHOqvPLEObUShlJL9sCgR1hBtzdEoSu5EMp2CdxyOjnEM6mmdOg7S2aXW1HyQwQIZdqGk8lWkazyUS3PZMYSvJXkaYDmDNmow6+KdMyCG0DEpsG2GLZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863324; c=relaxed/simple;
	bh=KYaaNQMzTyncgQyqSCq4P2yL0PsSWqFZF+5bbRW1HLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAlI7O55kk3Uzx7YKX4C0WhAu1MGnujP0tlweCjHgE2QE92DeSixsRKmpiAM5ujQnRTJAPcNZ3hFitfV1yO6XP1pZ+a7/1dPdjlfQXnPSp1Wq9sXNIPGoMwxsiB7TuPUqiNF/Zz3GeDApVr43z8xYS7b8sKCtmgISovKCzCGwxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0HVGjNo; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0HVGjNo"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27ee41e0798so99911875ad.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 11:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863322; x=1760468122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEWpi/vkQDymkY4TZuKIEKhri9YrajHYIJ3EVRMXvNM=;
        b=k0HVGjNoxrv+cDkt0LCnj2jXFpQRPZXbJFCsqXO9RoWy/zpE/8hxzpZiJojck41jBS
         Tobu6aRiz3BL9C5GfZSUWBE6PP+2s9twehK3hxawTgPD0nkYvitPQ/LrDPCT5rBYFiDA
         jYfnw3jNMkegNPNb3o4db6vDVcaBgEqcVeWmNYt7BGMirl1bt7S3YvDiRqj5W0GfwlQn
         r5OATYMhAnv6ympM+hbhWeyoAMIIVZ5GIB5JjY4jrCb282doXwyGP3j/SJo/91Pe8XRw
         pNXu7qUrm7I/O19Eki6mpXAqecAYUaqN5LltNIaHEUOY+IFUSGEiNeH5UT4Lwjjq5CZi
         fkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863322; x=1760468122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEWpi/vkQDymkY4TZuKIEKhri9YrajHYIJ3EVRMXvNM=;
        b=VVb7Qe5HqETMTzPk2uioGhaZY0JkAigAFpnp59XiZA6Rvt4HxgoCP35MpusHdk/C5b
         MAo16Djm+ceFxim78K4r6HnTtT1HJaru2mser8B/qvoTaa4a37yhKOt7IrocqdH2Vzdm
         BmtWRhlb0FFFXMeAWBlogQ/UqlQfibj/04jwlLFNSrQsrpJMTk3ajisOoEowEVs8mnt4
         w34/5zcTcrYBkwQwfRZB8yt2t87ozJiHGsJbJbu6lZxJ9SYCePAoIQCjmXc1Nv/RTg/d
         mo72wAgk6i2+RWbdCX6bwrN1qeXS5XoAwHwu2gd7yfW6s4kNLCIkud5zECar+GjJDJQq
         EC2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQFgb7NmZWgcMLLRBIKZECEGHI7tbBThO9WdgurwRB5HkpcMwImtOeMqb39CNp5QHRpw8zw8amqtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKqDhhlXpIP9YU5Q6VYGYLjnbj1itak1Nf15C18Il0UM5I8cv4
	n70N5gO2LtX5vmXI9pbM4cHVGrupay/iEgmj/Xb/4lxsv+44CfghXC0z
X-Gm-Gg: ASbGnctBzI7Cf/3ocqOIFdh+bPSAqSSi17sLIGK8JbQ61WcVVLMe7dhTQZGdJxwSZp2
	ZJ6edRUkLFtEXwcGy8EoK9Yp99uGZ1Ez6r5DIv3V6+Vt6cGz3eh++Ga+agql+bkYiwlsqBfJbdR
	OBn34cZhazRq1wvHYcEBJq7VMtqwUwzIbAfwTdXqXi9dHQ/kFA2hJTSpQZNon6dUMNeRUzfCO2l
	iLaegmfWc5ag2Gd29Z2SyjSVHjhj+azuCXZahxGdasXRB2PN6Ja1UvLOPL9+0RrSQKYWEa5ThR0
	SGJKE1WmahxNt/mOxHuXivqMqo6TecrSQJUhITs3OkFb5gGtrkMMrv6r8ewEtilhMVGhOFVF32F
	MogmQkUdxZZ977VgQOu01qR2aCeeC29a1F7QB6HYMZ90leEgCLm4WoLZEp7GvybiThA==
X-Google-Smtp-Source: AGHT+IFkC90TrbmYWdFb8+Squ/yvNSbuyPw/2N1C/NN0bhPNNPcOuqO79tcCivw9Cvz+HmCkqLSG/w==
X-Received: by 2002:a17:902:d607:b0:269:8f2e:e38 with SMTP id d9443c01a7336-29027356528mr10234435ad.6.1759863322179;
        Tue, 07 Oct 2025 11:55:22 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:55:21 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rostedt@goodmis.org,
	corbet@lwn.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	crwood@redhat.com,
	tglozar@redhat.com,
	costa.shul@redhat.com,
	jkacur@redhat.com
Subject: [PATCH 0/8] Documentation/rtla: rename common_xxx.rst files to common_xxx.txt 
Date: Wed,  8 Oct 2025 00:24:49 +0530
Message-ID: <20251007185508.40908-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aOUMyGvkibvOV0IS@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a continuation of previous patch available at:
https://lore.kernel.org/linux-kernel-mentees/20251007083228.17319-1-krishnagopi487@gmail.com/

As suggested by Bagas Sanjaya, this series renames all common_*.rst
files under Documentation/tools/rtla to common_*.txt to maintain
consistency with common_options.txt and to avoid building them as
standalone documents, as they are intended to be included by other rtla
documents only.

Each patch renames one file and updates the corrosponding include
references.

Testing was done by running "make htmldocs" before and after the changes
to verify that no build errors were produced and that the rendered
output remained identical.

Gopi Krishna Menon (8):
  Documentation/rtla: rename common_appendix.rst to common_appendix.txt
  Documentation/rtla: rename common_hist_options.rst
  Documentation/rtla: rename common_osnoise_description.rst
  Documentation/rtla: rename common_timerlat_aa.rst
  Documentation/rtla: rename common_timerlat_description.rst
  Documentation/rtla: rename common_timerlat_options.rst
  Documentation/rtla: rename common_top_options.rst
  Documentation/rtla: rename common_osnoise_options.rst

 .../rtla/{common_appendix.rst => common_appendix.txt}  |  0
 ...common_hist_options.rst => common_hist_options.txt} |  0
 ..._description.rst => common_osnoise_description.txt} |  0
 ..._osnoise_options.rst => common_osnoise_options.txt} |  0
 .../{common_timerlat_aa.rst => common_timerlat_aa.txt} |  0
 ...description.rst => common_timerlat_description.txt} |  0
 ...imerlat_options.rst => common_timerlat_options.txt} |  0
 .../{common_top_options.rst => common_top_options.txt} |  0
 Documentation/tools/rtla/rtla-hwnoise.rst              |  6 +++---
 Documentation/tools/rtla/rtla-osnoise-hist.rst         |  8 ++++----
 Documentation/tools/rtla/rtla-osnoise-top.rst          |  8 ++++----
 Documentation/tools/rtla/rtla-osnoise.rst              |  4 ++--
 Documentation/tools/rtla/rtla-timerlat-hist.rst        | 10 +++++-----
 Documentation/tools/rtla/rtla-timerlat-top.rst         | 10 +++++-----
 Documentation/tools/rtla/rtla-timerlat.rst             |  4 ++--
 Documentation/tools/rtla/rtla.rst                      |  2 +-
 16 files changed, 26 insertions(+), 26 deletions(-)
 rename Documentation/tools/rtla/{common_appendix.rst => common_appendix.txt} (100%)
 rename Documentation/tools/rtla/{common_hist_options.rst => common_hist_options.txt} (100%)
 rename Documentation/tools/rtla/{common_osnoise_description.rst => common_osnoise_description.txt} (100%)
 rename Documentation/tools/rtla/{common_osnoise_options.rst => common_osnoise_options.txt} (100%)
 rename Documentation/tools/rtla/{common_timerlat_aa.rst => common_timerlat_aa.txt} (100%)
 rename Documentation/tools/rtla/{common_timerlat_description.rst => common_timerlat_description.txt} (100%)
 rename Documentation/tools/rtla/{common_timerlat_options.rst => common_timerlat_options.txt} (100%)
 rename Documentation/tools/rtla/{common_top_options.rst => common_top_options.txt} (100%)

-- 
2.43.0

