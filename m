Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="C043Y/o3"
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C55A1B1
	for <linux-doc@vger.kernel.org>; Tue,  5 Dec 2023 18:58:13 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-42573090000so2668931cf.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Dec 2023 18:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701831492; x=1702436292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+W/qJKZ4cbrJ9KJlY0HysuZCkaE03MWjevhyEtd/+k=;
        b=C043Y/o3nmZqO5drW/ytixLfQ3/Yg2tetNJ0mozl0W+LJt8PrvkZDAAIKO//77o7xS
         0vqPrnh0AqwIRYO3RKVoC5ULQcJfkvb/hru7xXNasnVGsAPahqk16ksdIVuzY9m7ZPUf
         re6qs37H9QdFVzcLsxMv/4Ias8TG8Qd/jvNo8H4/2IcQN9MMZn/cSe+z1fFc/AOMpi9n
         x8wq5qimJhIL8H4RTe1di1VNm1dSN2c6r0v68/rRjx1+NtfNHJ8swQDXd5oHh8enH4Mr
         N8/keY1Gykp3G+pSqxTDs5MRp9GN0a8yzS7JrndjN7fO4b3X3N6pGougdIX03jUMTvQn
         ZXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701831492; x=1702436292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+W/qJKZ4cbrJ9KJlY0HysuZCkaE03MWjevhyEtd/+k=;
        b=RH68mHzXeghQ9vkAGdMiiDak7tlNS6aou3UOLZJ9geAyGNGfaocR45TkVShs5xGxcI
         faR5XKPKAealNWxX5KO8XKLSV+8MkTUjKjJSN8Ayzr84BvdR1GhJNFn3fxpU67sXv4C9
         p0PiQhCsOzKWqm6q6NhVIdt7H9hrnzUWgMdRpu6IP2vECMvvsR5ckmxE+nTDMtZWtudW
         kQ6AvwoZ2Jt4sAxwU6Ebw700x7hXDVBHJIZPUtye14sIXVnBMXXcNqDrpThyGJRgaq4n
         Dl1VZF7N4zB17T3KWxPHE99PGTpTn1ZENg/tFOXvTX1ahKRTIbA5kfzEdRoM/GM57apT
         fGrw==
X-Gm-Message-State: AOJu0Yzi/dCzFyOxN5YEfYENwapDG6rPLTpdrsg5LpeJQkREih7wi056
	kSc9MsIy4HIEqdO1KWdaGzBEw9tIS32XIGE1B0C5Uw==
X-Google-Smtp-Source: AGHT+IF/PbeDPHGTwTbaA2pV4mOFvfRBSKmJB7XTO8IsjUWL5YNJ6TW8QV1NfT/POdd4ka0OvkcYQJe1EpzjjtkHa0g=
X-Received: by 2002:a05:622a:1315:b0:425:4420:c176 with SMTP id
 v21-20020a05622a131500b004254420c176mr3223260qtk.27.1701831492370; Tue, 05
 Dec 2023 18:58:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205223118.3575485-1-souravpanda@google.com> <2023120648-droplet-slit-0e31@gregkh>
In-Reply-To: <2023120648-droplet-slit-0e31@gregkh>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 5 Dec 2023 21:57:36 -0500
Message-ID: <CA+CK2bARjZgnMBL9bOD7p1u=02-fGgWwfiGvsFVpsJWL-VR2ng@mail.gmail.com>
Subject: Re: [PATCH v6 0/1] mm: report per-page metadata information
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Sourav Panda <souravpanda@google.com>, corbet@lwn.net, rafael@kernel.org, 
	akpm@linux-foundation.org, mike.kravetz@oracle.com, muchun.song@linux.dev, 
	rppt@kernel.org, david@redhat.com, rdunlap@infradead.org, 
	chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, tomas.mudrunka@gmail.com, 
	bhelgaas@google.com, ivan@cloudflare.com, yosryahmed@google.com, 
	hannes@cmpxchg.org, shakeelb@google.com, kirill.shutemov@linux.intel.com, 
	wangkefeng.wang@huawei.com, adobriyan@gmail.com, vbabka@suse.cz, 
	Liam.Howlett@oracle.com, surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	willy@infradead.org, weixugc@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Sourav removed the new field from sys/device../nodeN/meminfo as you
requested; however, in nodeN/vmstat fields still get appended, as
there is code that displays every item in zone_stat_item,
node_stat_item without option to opt-out. I mentioned it to you at
LPC.

In my IOMMU [1] series, there are also fields that are added to
node_stat_item that as result are appended to nodeN/vmstat.

Pasha

[1] https://lore.kernel.org/all/20231130201504.2322355-1-pasha.tatashin@sol=
een.com

On Tue, Dec 5, 2023 at 9:36=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Tue, Dec 05, 2023 at 02:31:17PM -0800, Sourav Panda wrote:
> > Changelog:
> > v6:
> >       - Interface changes
> >               - Added per-node nr_page_metadata and
> >                 nr_page_metadata_boot fields that are exported
> >                 in /sys/devices/system/node/nodeN/vmstat
>
> Again, please do not add any new fields to existing sysfs files, that's
> not going to work well.  You can add a new sysfs file, that's file, but
> do not continue the abuse of the sysfs api in this file.
>
> thanks,
>
> greg k-h
