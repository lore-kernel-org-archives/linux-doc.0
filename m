Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEDD22541C
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 19:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755199169; cv=none; b=rE+E1/cyAeIK2bkSUnkSJH2Q7GiMI1nioWvCzylgPWJyYWF5oNZTlE34JNpxez1t+/rdOIsQKlKbq6F3fFz/enLiCYIArSvl2mt4xCbl7cW3qAeLmvnJk+zv50jMxIRbmvwXFqV384VGJG26+QICqe7B8jRL1fruKjkC4mQvlYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755199169; c=relaxed/simple;
	bh=GZrMOqecm9CAXjRBdYJgjbJgjQE37LwuoMcleOFOzN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cD8LGi/C8mZxZEVaMBjvuIzXj04MkWyn1d1zTcJXTUprcR1GcMsnKO12uA/2oSa+qNLfsIqIvIQ/XzWLDU7saxMfurjUfCa9hhfvX/vNqrqDPAY9UxcNDV7zziXgHqPsFg2QH7IMUHDL3N4P8KSQZAVtNk55iNpTUEfZcPnuobM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Sk+EMZw3; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Sk+EMZw3"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b109c482c8so23200791cf.3
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 12:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1755199167; x=1755803967; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GZrMOqecm9CAXjRBdYJgjbJgjQE37LwuoMcleOFOzN0=;
        b=Sk+EMZw3gtt1Kc+KQUk0IjMhmiwSweTjX3U0sQuDlp01ImsScESjG7DfPaSp7gQ0xB
         jnSDNwCcV+5rVjAkep/QGQNNXtX619jD9ntUjcq3Vgq3o/gwXuciuUtwSTUJ+yCGU+d+
         650qXU+NziDKW25fY+3FsI4l3NEXHsD6y8rtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755199167; x=1755803967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZrMOqecm9CAXjRBdYJgjbJgjQE37LwuoMcleOFOzN0=;
        b=rU8Br7q62dDHSk8NHxJRU8n7+hxsdUNkXN32edslf/sxAEoGQJPuldL/0DAoL++LYE
         BSAhiAXBwvnCt1v1Heb1kCHuCeIs+ESr2224vFzPvKqpqBrD2HhsUD7WijKvU6hN5H61
         Qslw55jM1VnPeEFCUKSmFbwfo4r0jUMSP0wccvX5My5YXquavQLjR0ykRRpqhkwlePHo
         9gwjbkNa/phxZY1jWiYIXkIQHj4x6aFaOYJvKO5k4fj+hSbf6Nf86RN2sBVyuwNeZZt1
         XIqLYG0GevRoS10PjX1yblvQ8T8vYgLJUI3Uj5EcJwo+fvRgHs5JxcRQ3VAAUtp46P1X
         98cw==
X-Forwarded-Encrypted: i=1; AJvYcCXqbXvod1MlodduTw/s6jDXcjmHYUIoc0ZDAd5V0c1M0ZQ1CAuIRpAfarWXyLz7HYECp++hiOQ0Ju0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqLM6PRikJwd9JPy2velt1sdOpSxqWM5JHWHtAT3jI2ISWrHVo
	1fc6km9vikuvAy48/gwBqjwQqZF3vqPGqXkZ1lRCikL9YFBF1sCirgqoz5GjGrBjxwFmdlLlYDP
	Ux3jGebiX6GK0ihkUuzjgqpapC5RZGPa7UkZGyh0LSQ==
X-Gm-Gg: ASbGncv5d9b9dTwhKzko3OLwHcO4FttOUjxz2INj5o0qHf05/l4RyaDeENRFA2LSyUi
	9+1Z/RiNAW8ZU9ip1Lb5ePd4hXSah855oG4rf+K+fAIDdHlCJcOWFPxntjLeFyPpeJjIoO7eWfB
	jQUDycCdK+aiE5sgK3e+ltC8tiuIJB2yL+b+i8Acbm+FqnuK8tpuUYmAktNf8GxiymP3LG0OF9T
	vQ8fcZQtBuUWdQ=
X-Google-Smtp-Source: AGHT+IFYsASkbgj8LKOURL/sQT2BfijqH2fGAl8jogtfvvYUVEiGcWyswxRpTwKUf9rW7ApmSBhJ6Ltm7fsi8IzNXrY=
X-Received: by 2002:ac8:7d43:0:b0:4af:157e:3823 with SMTP id
 d75a77b69052e-4b10ab61354mr68262251cf.42.1755199166768; Thu, 14 Aug 2025
 12:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703185032.46568-1-john@groves.net> <20250703185032.46568-15-john@groves.net>
 <CAJfpegv19wFrT0QFkwFrKbc6KXmktt0Ba2Lq9fZoihA=eb8muA@mail.gmail.com>
 <20250814171941.GU7942@frogsfrogsfrogs> <CAJfpegv8Ta+w4CTb7gvYUTx3kka1-pxcWX_ik=17wteU9XBT1g@mail.gmail.com>
 <20250814185503.GZ7942@frogsfrogsfrogs>
In-Reply-To: <20250814185503.GZ7942@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 14 Aug 2025 21:19:15 +0200
X-Gm-Features: Ac12FXwFvJoOQXfTVyVQkORoWxApgAqsvX9WIX8VNMR4nJ4kVqHzj7yLc5euRJ4
Message-ID: <CAJfpeguxZVVddGQsMtM35tVo0dD118hKBf9KJcuhSBznzqUzSg@mail.gmail.com>
Subject: Re: [RFC V2 14/18] famfs_fuse: GET_DAXDEV message and daxdev_table
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: John Groves <John@groves.net>, Dan Williams <dan.j.williams@intel.com>, 
	Bernd Schubert <bschubert@ddn.com>, John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, Aravind Ramesh <arramesh@micron.com>, 
	Ajay Joshi <ajayjoshi@micron.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Aug 2025 at 20:55, Darrick J. Wong <djwong@kernel.org> wrote:

> Or do we move the backing_files_map out of CONFIG_FUSE_PASSTHROUGH and
> then let fuse-iomap/famfs extract the block/dax device from that?
> Then the backing_id/device cookie would be the same across a fuse mount.

Yes.

Thanks,
Miklos
