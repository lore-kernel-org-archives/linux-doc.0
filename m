Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70591E3CB0
	for <linux-doc@vger.kernel.org>; Fri,  2 Aug 2024 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722604879; cv=none; b=Ljo9de+zPCXzAMv/f4JMjRfTPaDBXZhWi+rthkKy6NgU0CO+lkz8tROsFRGFR+4sDdqWfQCq/qeRZ61xcn5DGbBKzOGhM5Hrp0F6Ich4RrUgCtRO+W9Fb1ls+CC9IUVOQrP9Sx6Hoc8AhFJrD5Z5bP/vKtFaycN1/GV1bUvBrRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722604879; c=relaxed/simple;
	bh=VqWvJwzVuU6BW4ZoCdK14eQ01/hn29Uz9tS0RmOI9FQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=STHv7X4xVnAGz2c9emxGu2mP3yhOQrRMJbF9LjOeu59vWz8oJ+xQuXcfHibY0JWhYRO5XwMbZMn5TC/H9zq/dQDVja+rpXTPA/OMpSf6N4BDCFEb0NaX7dxwQ0M0LGQVMOjiTAYXbF8rY8QXtiQT/rDpQtC15eowf7TYO3Wcx6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pewwMBAh; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pewwMBAh"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-65b985bb059so153606047b3.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Aug 2024 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722604877; x=1723209677; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VqWvJwzVuU6BW4ZoCdK14eQ01/hn29Uz9tS0RmOI9FQ=;
        b=pewwMBAhXBK0IxscaK0f/8J4vA1vtJOM9cLcYfTmzuQHgizgHQZBZPoirbsnP6797/
         zQrVLRa4LiJFWZzdZwiM/8Yq5BLl0IuiniMnCwemCrUpH404XhRKr9VnUxnfZccd6PjZ
         zjeS3zNKkdzz1feK1vNEGB5chLNZQ4udXIfiwgWMCoBmAqppxcpdHSvHE7jDReHmqD/y
         RvbHxxw0iK31EHNnb2pZlqAUl33cDa0/SbsEePUmHkVaqTcaOQoySs7//3Ol+jt66hWo
         qykWw0y+XD+GgcigyapjFvfq1Mp2fSi2ooOvWECOaDELzaNA0FfFe9rWMQ061oqGy9k1
         9LFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722604877; x=1723209677;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VqWvJwzVuU6BW4ZoCdK14eQ01/hn29Uz9tS0RmOI9FQ=;
        b=UMc9WBA/EUTqv7SKJnrxuEFSJ2dPcSvpSWH1WCE+iurv8sDfUEpTkyZCdoAr/qlb3G
         jvhafscbK/0sSjCTr1OFSGkMpb6pta/g9XmJWIvTUBfLD2lGOO3hoLqZRtETBxRAhivj
         ToKIoaxUzFlI+dqjowsK2BuygjZKn0Uq4fxfOuZ9BBQsdYKWl1OvNdgSvvAe7Hs+vPgx
         p2eg/JaMMGXMCHE6lJuctukhz0MdHJ+KqWEUVU4g1w3riZXuikE/vBBC1TSBsR5ojsIe
         LJYroyz9Xj+B6OGiWAgR9x/9OlyJyNyc4Cp/dhB30cJbul2DL2fT0t0PAnR60b7sDtzI
         2GOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/EY6/HU1ZnBNe7TYB0a7nj9BS4zk96H+/on7FlJ2JNPPz0mUa9cikSL0GssIYBT4ZgitaMesnZpWbHmUJKT5JZBmTlmnLeNOE
X-Gm-Message-State: AOJu0YzmLEVzT+OT1BLjMaNK3Zp4IDAE1TwPVWxwHcFc9FobkYPB6c5/
	oT0dmxLd0uP3vXsQLp6qykafD1ib4lfMd1Gb6uN/aHq98C5Cc/0xB1m0rT91v/YRGSFRf1FfxoX
	izQ==
X-Google-Smtp-Source: AGHT+IHdRmcx0BA12mQFvBkaYKf4yeXN8VHL+lxgAUnC2ca1x+ewJOhgKPm1A6kYOopWXAceWjBrUMi5Ftc=
X-Received: from glider.muc.corp.google.com ([2a00:79e0:9c:201:608d:bed3:6fa6:96ba])
 (user=glider job=sendgmr) by 2002:a5b:ec8:0:b0:e0b:b7e5:4570 with SMTP id
 3f1490d57ef6-e0bde483a53mr80169276.12.1722604876722; Fri, 02 Aug 2024
 06:21:16 -0700 (PDT)
Date: Fri,  2 Aug 2024 15:20:36 +0200
In-Reply-To: <20230606154628.95498-1-itazur@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230606154628.95498-1-itazur@amazon.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240802132036.914457-1-glider@google.com>
Subject: Re: [PATCH v2] docs: KVM: Fix register ID of SPSR_FIQ
From: Alexander Potapenko <glider@google.com>
To: itazur@amazon.com
Cc: Dave.Martin@arm.com, corbet@lwn.net, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, marc.zyngier@arm.com, 
	pbonzini@redhat.com, zulinx86@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi folks,

I also came across this inconsistency in the docs. What happened to the patch in question?
