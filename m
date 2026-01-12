Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D092227280C
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 17:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768240260; cv=none; b=Hm4HW/J0CXBrYPaVVSzDN3z+8bWfgsMy3lRmFl70XKREgVOvcURdHxVyh3G5C7jhiYHReBmbWscFsk7MgYZYp5y3soHe5bS7OcLjsJ6EyWQghH4NlITS9uDqlMnfKxMEUV5yXZ8EL96V8UW74PTW9VJ3EhvZka898BoGqanIoo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768240260; c=relaxed/simple;
	bh=+VWjEfwDhryU8ObQ2/gfNetPisVn4j+sD6WRIehdzR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adv2eaeTQShn1h7l2GF4R5ML6NBKuPWVfJhs+0NIlVnoAn0cmHW3KFQ+mPa3BBG6yVSJg3u6SnI22qekULRiqajPCkOJs1qFw5LWGe7rocHKcmUPXxxcvtTt7CVTZ03mLFQCg7wZk0c42n6GUb434+9xlrn9GvX5tdKTxKEkAc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rm3Xtq2g; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rm3Xtq2g"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a12ebe4b74so64318145ad.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 09:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768240257; x=1768845057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piLUL2M8WMtGows0Q7lGhuaH4xf67uj9PmnQl3vr760=;
        b=Rm3Xtq2gay7wNALFjw5bYAEewyHoTTuGIB+pTTYVGAjiy/o4NFos1cCaQn7qHBzzfR
         gIr9VPSx0C+JKZ1RWuhr0Ple84LU4GE6SjLtEA6IFMl9WHP0RuK2rI8gJy6ZEtm1FGDf
         9OL9bowvDgRmkkfLLS3oyU2V9kFciaYE2dGtEHlhUlDc8u7Ufp62LZBMu/2aA+SUkj52
         SRVSvqsdjWaNZLqAbXR6q0/puQUUYt69sRFCYHBoUxL01otWgmTbD0VPbn3CcCkTx0Qy
         ZBNDtQ/bGuLP0buEs/gDrsRtOa2EUj56sTF3EPajAFmeEo31erdnejRV6JqZ8DBrajfo
         s0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768240257; x=1768845057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=piLUL2M8WMtGows0Q7lGhuaH4xf67uj9PmnQl3vr760=;
        b=AT0HbwJk8JDEPVNirwaI5gGRdWjM3k+HoNk8aePX4y5aOO60Wl1sA0ceO3WGV7rhJm
         rmoIGllGcsFtLuQqRfk6RzKe8LXhmzSGcgmGADxVuiblHAW3Kd9xL2a01igPOwQD3und
         K7zXjD5c69s/whbqWec3z7KN9NFIJCVox4sZjwSMDxTUkaLesmc+LAXQg/DABRwTER0h
         ovTb2hzeV9Euh+ORZtJLqqYIh+EfzS7yeTXsDRDPSvIslwyM2z9Hc2qXG0KvvTBaetZ2
         nuGg9S30T90aiD1/99WfAM0dJ2cSnP7VIqxV/9z67iV3hHR1BSgQElnX8F+yA5v3AZRu
         WFzA==
X-Forwarded-Encrypted: i=1; AJvYcCW+KK6iUUUrK58VXWNa1xUmLCHURQsAwrZrl3DeMeP/ZJIyzZYJ/V2EKWgcVnjLej09RwHCBtVDNO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9cFHaWbvGw9nc4WYI+Wwbbo6/DieSrIL8ZlHJ0wWKECGGSCDO
	t3QYacXNlG0UoZIxn3W1SlWLqiVFZ9XhNSvc3KyVoEbrUvxv5iAqvTpW
X-Gm-Gg: AY/fxX5Z1kN7bUOTk5wQG525m83ALAJxFzIYqKFL1dsHIbGlSV/h21RQR4Hz/XP+o6C
	sVSiq/WK3W6IICK8UNjClToCYpSw30qJy6wZGjucoJEZnYuqsq8KNuB8Bl9EMiyK8jhwZnUR3eR
	IDu7LGQKbs0GvpFSj+YQ3O2VE/mdWTnS82MILDBOdaSaGsOFQTt2+GImopBCfIqnlAsChCKBdzF
	CArdfnXlKFMMGxWUtAllygqyJ99uDy89VVmZGII/6ojwwoUO1XQnDDUvlyVsDVV44Bm295DTUrM
	Z4D01IzetFRKzmlpfQ72RqKhl4Q/DspTw1HoXwY5iVry/Mc/DSC7REVv07ir1yBHi+km2iL0sr/
	nytqXb4wlHN1cDHB+7acXgg6KL1byenALme2sykdyvPKlf2KbshbDITnq0uVIQIRO2oT44iHCbP
	rNP9N9cnj+m8pc8H8Nz5HAGeFebM0=
X-Google-Smtp-Source: AGHT+IEk4xXPZRyodP5FSOXlD/IumhCAd7oJ19PiJjZ1roGS/dFYPtWdjiuAhErB6M4ZBAK7fFIgCA==
X-Received: by 2002:a17:903:9cf:b0:2a0:c1ed:d0d9 with SMTP id d9443c01a7336-2a3ee49b022mr168358015ad.46.1768240257133;
        Mon, 12 Jan 2026 09:50:57 -0800 (PST)
Received: from rakuram-MSI ([2405:201:d027:f096:5c52:f599:118c:bed2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a464sm178347915ad.2.2026.01.12.09.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:50:56 -0800 (PST)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: socketcan@hartkopp.net,
	rakuram.e96@gmail.com
Cc: corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	linux-can@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mailhol@kernel.org,
	mkl@pengutronix.de,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH 2/2] docs: can: update SocketCAN documentation for CAN XL
Date: Mon, 12 Jan 2026 23:20:49 +0530
Message-ID: <20260112175049.10716-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: 20251231-can_doc_update_v1-v1-2-97aac5c20a35@gmail.com 
References: <20251231-can_doc_update_v1-v1-2-97aac5c20a35@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 31 Dec 2025 at 23:47, Rakuram Eswaran <rakuram.e96@gmail.com> wrote:
>
> Extend the SocketCAN documentation to cover CAN XL support, including
> the updated frame layout, MTU definitions, mixed-mode operation, and
> bitrate/XBTR configuration. The new text also explains how error
> signalling behaviour differs between CAN FD, CAN XL mixed-mode, and
> CAN-XL-only operation, as implemented in the current kernel stack.
>
> In addition, provide example iproute2 "ip" tool commands demonstrating
> how to configure CAN XL interfaces and corresponding bittiming
> attributes.
>
> These updates align the documentation with the behaviour of recent
> CAN XL implementations and help users and developers set up correct
> test environments.
>
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
> ---
> Tested the documentation build with Sphinx; no errors or warnings.
>
> Used below command for testing:
>      make htmldocs SPHINX_WARNINGS_LOG=warnings.log
>
>  Documentation/networking/can.rst | 615 +++++++++++++++++++++++++++++++++------
>  1 file changed, 518 insertions(+), 97 deletions(-)
>

Hello Oliver,

Any feedback on this documentation update patch before sending v2?

Best Regards,
Rakuram
