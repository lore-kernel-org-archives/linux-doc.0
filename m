Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE6D47FB0D
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175058; cv=none; b=k2pdbUvKqbMzxlqXWOQj0MK2WpxjMBWDbsBrUvJd/yX4+3Ic8PwLl+rb7O4jqY7fDqyCQCxeVj8th362TjeY4s/b3+VIpL5dH34Akg07cjOkLxfleXn9jS2ApEk3RK24Ii6PnlbNhFu5VHCJRppWtsNJe1j6b/EZsyDSW0JnHM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175058; c=relaxed/simple;
	bh=bIepsGyPsDjDb0Ip+H9KtkM7Sr8wz3KXlJWJMjG+7aI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=JMGrG6IUdkUTOLTaJ5bxWLWPKFG/s+vHtmOVB8pZt/9upju5YZbZGqFN6zvKcu/8+tMf0BjirBKLrsWRnuKABdlONVWrQ5+Qn0Vttj6nTu45CMZXNGxAo/44y2qNxkEiZpYCneNwMKYWb03e8TYuRtpm9Ql/xEJRG6zb1msxV3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5l55XuL; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5l55XuL"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8875d220446so160338b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 11:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792175057; x=1792779857; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bIepsGyPsDjDb0Ip+H9KtkM7Sr8wz3KXlJWJMjG+7aI=;
        b=b5l55XuLf4CP3BRvUqG+XkMBAHbn4cXQ/jQVbkSRkBEkPv4QIN/8I4DuigTBnZ0cs3
         klUirn4hyw3Jh0auzmAHtsqQoeS1tlU2YD1kVL6CRw9RghaU6lLmWuL/PCIyy4/+NQEx
         0haL5wH3moPytqEENOkCe415nZUpbJ17TR+DV8A8EDbyqEj+gRQMBtfR8ipiruRbb5a5
         KUHtJiXaHT3/evZVSCiAoYQ9UoTaGudRW0MsAHJd/+ixtTOZJgiQUWWTe+OsNhvqgWcZ
         Q4CgjWz8Us7UP39g5MQTE15sioUUDj+rS5d82PMNvQgzF/UEAEG//CwwxOCcVvKkAuYJ
         VKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175057; x=1792779857;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIepsGyPsDjDb0Ip+H9KtkM7Sr8wz3KXlJWJMjG+7aI=;
        b=XAqN+IQI3NjIFkEhOLPbEUwkNhhw91ae+JgJwFCIWzXFE658mrWsbaNm20sL8670lH
         bKNXMOzL9Iol7yP5uGKZ0dNDupAnUZk9jDv2cY/2mUVMb3WdTM6QV2iuBWPwyLdeiJ3b
         WwzM1TDqm0HKYvSrIgdkZspMu7l/MRPeVj/AC0Qcs0144BR/IWpXqc+Rpk3t5NqLSq/b
         ZXrSIKsDO6D3PKtB2HyvEybeuDw3+PHA1RHnvadcVVWrxKrA0TPKqaO7QCu2cNJNEskz
         oa7A05HFHgRctXMK6DDDJIIo7o6cV1DjC88891FEjALxCQD2Fnl2n/i7AXhg5TML3XI3
         7dVQ==
X-Forwarded-Encrypted: i=1; AKwUvByzmdahH8fxT28MG5veI1d3xO2d+Hhmuvdn54Wp8bPi/ERtr7QyjVGEyA9La+cuPO370u/ERrUjRyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQiJVaBtKrSwBpqDHhYRBHvQjfoo1pPqxG5eL1k8BDfWwlZayh
	nafM+SD2uXKa7hEp5sr3bVvzEDdbKTneBLN+SS5WgoLL4b6RnDUYY0vc
X-Gm-Gg: AYBFou0Km5hvFUvZ6ISn/kS24tDwuIaCdVkeUxnYlClo3BH5Fsj56GtFKyC1DKMzxPP
	hJWZYj/r19IOs2q7/zDDLAemmtiNAMwhdTk8RYyA29bh5xq6PtkI5RMw4hU5o4fM3PpyXnHbLyI
	/98xXoPanDtan/IPRQlvTGweJr3B5c3p2DuqUmq4MVZUuy3kG94Zpma3xLr+3KHhnjnMGxDkAMT
	sdfUvHm/HvVDBVHS8avRd1gqX3145GfLgN+cE8wwkE77x3w3eVE3Xh4DT9WZ9u9yrbxgipSzdoQ
	nPu7bG7NVml6+7Bg/kXBUj143ITBcbbqURSlLD9HevAjkNGrqlQ65vOoHvjgXPdCckO20s6r8kS
	t3jG0eFcFAaMP14y6w3NRY3YrzojVCiSyaeBV/wPyishxIkbKfnIzP14vn1rP6i74Pc3I5F6Bcg
	yFHsjZh1GFbLL3P7EgdMipqZQqWJAs3itNjW73CdfKydOBtv3q+qvkIcgKXdChpd3/Ntsty4q6F
	pVW+QntscmGFErmEPjPmT0mWhd3yiEZrNvrtPaBbRl7qxD7BcoYv2Weu7xk/GJZ37H/BrEHV3MF
	isI=
X-Received: by 2002:a05:6a00:4106:b0:87d:dc3c:1b5e with SMTP id d2e1a72fcca58-8a04ba2601bmr396865b3a.26.1792175056503;
        Fri, 16 Oct 2026 11:24:16 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8cf81sm1506688b3a.16.2026.10.16.11.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 11:24:16 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 18:24:13 +0000
Message-Id: <DM6H19P1797J.2QYZAQAOI9FTN@gmail.com>
Cc: <workflows@vger.kernel.org>, <ksummit@lists.linux.dev>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Mark Brown" <broonie@kernel.org>,
 "Theodore Ts'o" <tytso@mit.edu>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Leon Romanovsky" <leon@kernel.org>,
 "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>, "Thorsten
 Leemhuis" <linux@leemhuis.info>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 4/5] agents: add a skill to find other instances of a
 fixed bug
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Sasha Levin" <sashal@kernel.org>
In-Reply-To: <atJnq_ssIAGK-OSZ@laps>
References: <20261012213452.1863248-1-sashal@kernel.org> <20261012213452.1863248-5-sashal@kernel.org> <DM6DXZJSMPO3.J5PONDJ3HWNP@gmail.com> <atJnq_ssIAGK-OSZ@laps>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 02:06 PM Sasha Levin <sashal@kernel.org> wrote:
> What I had in mind was the kind of bug our scripts/coccinelle/ rules look for.

For kfree_mismatch.cocci kind, yes. Each site is its own bug.
But the other example in the guide is "a missing put when leaving a loop".
That's iterators/for_each_child.cocci. It was fixed one driver at a time
for years until for_each_child_of_node_scoped() made the put automatic.

> I agree that fixing the interface is better, but do we want to push all these
> agents there?

To report it, yes. The skill is read-only anyway.
Whether to change the interface is for the human to decide.

> So I think it should be a balance. When the skill finds the same defect
> in several places, it should also ask whether the interface invites the
> mistake, and if so report that the fix belongs there instead of handing
> back a list for N maintainers

Makes sense to me.
