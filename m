Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D603533C18B
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843708; cv=pass; b=bdsYI9VHcwMoedfNtO6dLn17HGIRe3C9MQTTo71UZYtxzXzI5a5h/xv2yXjbhKY0pk/Of/vanscBI7Y2jbm/PqrzOpkI8W6YkAbOfjrY3PaQ+P6jdVfcKDXOMSRgiY6+GWmlHUXntXfPdZSZ3t8rJw0I170Pl4d4LRXrvh6+J9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843708; c=relaxed/simple;
	bh=KTRA21nAfVjporOLqz1nEfqleKbtz+pYNCQThiLu4Dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxGw51IvzcnWLnLbzbQ+VkbyHA+tftOYQo9Wvw3XhPMGWBQOgsOvqMM08nf1WlBHPgSOAGiB2NqmwMo4+v46MIZYX1MKgnUZyla3LZ7CNM7M7398wKd5RobZcF0+j02OwOz1KQ6HCX44QWzu+ZSwq+ljMvkjAPHH17DeAnSi+kA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncXnZeZI; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncXnZeZI"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bd5658b901so379422eec.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 07:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773843706; cv=none;
        d=google.com; s=arc-20240605;
        b=IC7LPVT6RbpdliHD2z8p3yubOSjjqvU29Ur1F/jXcDDPpNHklRb0qwK1QE/dcNmgqY
         2HWiuxkz5IlKy4M/SHCLO4qmmE5Umr71ouZrp1wSSl0rzIuX/udA2t3bvDsh9yVdvfYA
         V/7asJgfgZE6s4tp4P0Bcu+mlt82HG+TLpFP7gt/fB/qrSN0Hd0eiKvPiOSEuNnBeEBE
         Ximw1b3Xjj0wBt6JBd0MvPwSedCN4+Ar2gLZoCiXur5J1zRbbdC7fykrn2d1hwZwo21y
         rXpnEt3dgnk0b7YRBMKW5JM+TGoQ+3g9miK39hgwAfIVESUP4XMtmRrLkKpOvO6/dUnV
         kdgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N50RuEjVo0iFefZqItqTOtUCCVZJT3+xKOol5E25ZQw=;
        fh=ExWzZytEVJ1Zl2MYNNq0uOC1T/0V/xXGY6LmOzq5lws=;
        b=eBHDhRA75dzYfDVr65pjsycPNlIbp0ZHDcpe7CdYs34YhF1trj/AoqQiK9kyhzorhb
         mJXD8R8hEDZ6cdOQ7pH6fugf7EJGDhWSrMcqmbYHB9iu3MZyXJjHqeaEdnPgxWdPptli
         ONwvqaglfY0KEU4SKFf4RkuiaW93t6mqVirUk6dmnLVopgQjHr4AHRw2D0BLjkY0pT90
         Oy30y4AXS13CHuJElxjnUWHR7/O3mPUeDxYT23qU6pwj07UMKrBNQpInD9C4hVyj2Ubm
         ejZfJGLziANlEpjVCrmPp8aKDvc0bJVjkL1LyS2l1OPoSbKVs5TJeiiV7N45kqeu8LOH
         C2Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773843706; x=1774448506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N50RuEjVo0iFefZqItqTOtUCCVZJT3+xKOol5E25ZQw=;
        b=ncXnZeZIuOjGeXZuihtqHQjQvOfKIZP6avWEj+G04ST+7/5OoAM+9W4HrAWp2tpeCg
         qV3oZ6vSIUONar/YjrHxliQhsxbKSf++6gTYV2KDYAwQZzOMCUGbOtGkQ/M6lnz8Si35
         8cajHQ6rXnuUoFE7lWJ8eh1IQ1/C/m/4KUEtvM30T6T49ccOSw3rhnYbt7WWtvJztqGg
         xn7Jr0z1OgIglV1lijREgwEUFbNUaZmqaxtkOe9YCHFQ/TStonivbob3Xi4EZ7I40dRu
         mVfTvnoUa3XQQ/Jr1rI6LfuZlzc4c2+s5rVU8DOEKSJk0D2JdP+oTLNkFO/SoM9RK0oz
         +L+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773843706; x=1774448506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N50RuEjVo0iFefZqItqTOtUCCVZJT3+xKOol5E25ZQw=;
        b=YE+iiYqk5nm9b7hGpNErYu+MvbUClSQcNj7DzoAbDuiBGGImEHzkD4Vs4ijXEsFEKR
         WeMckVqhiFIFXEmVjv7GLkVJLCI/b2/B7cDD3hnHIyOSxm6PXf60G1dcxJbrHmK9pthw
         LTr8lecXR1GTk4qoNOOGbtShIWewo4meJotq86c9XjALmAl1TdpNfgHJ5mrSfEs5fpPr
         m8QBZPZdoSYdr8rBHmC9PHl4ML1lzzSByNPJfVr20ArTO1vzZ+75GI1lAk3JcF6nJcDw
         qNLx5oo1MxLRegeDps/MGCdHNK8P9ND9rPPGLew6pAqpl3jtkK42sqGguFg3as4KdZJ3
         0wTA==
X-Forwarded-Encrypted: i=1; AJvYcCUALFapcDw49TA1w8l0eG9gvGHpFqYBm7u5Zq4qFU7PnU1l6MElkwsbxNyXMs5N0Gj/UxOTUmt+FDg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2TUZsju7LbQHpwjcuKX5FP/BSQNxl+8xE7hglAGwcMJOIXERK
	wO9LDGX/2tusujxsSplim8QNz8YjmpMNKhGW1w2cPbIBaC8yGZ+BPAh6mYRKNXW7QXATKKn1W/p
	wVZIO0O53xKqhDcInIv2Cu0iS8UfKDYo=
X-Gm-Gg: ATEYQzwerhSMqmbXEW3Y/gpy4Z+Q8snq59pmUDvBSi55efnZ/dK5QFi1r3MTvi3QZTs
	XkoLcWO+1qD5Gechh1jnEj62eVj+l/+HuuUXwJUoXlPLs08sN6kXIwtI8IAVeH5S6fI4dZQaXP+
	uCHmGgBClK/tGG/+dD4BgQADGYicEG95fyf9x5xvRFwgw789PmS3aVguT/32A2tEcUHtmlOw7ta
	C/WPVP2ZLn0dk0J9Nqpriqfan/dn6pVDnLYvFP+oVDlCigGJhowueZmVK27uPK4AQL8M5N00rRI
	fM03n2B+/mAR8hICAb5WA1kj9cgRDztQQ60o6T2WBnjJFWbp1XCxystjz0zXZLx7cEez5qRORNV
	SFa8UeCAve8+Hsz/GOl0+HHk=
X-Received: by 2002:a05:7300:3724:b0:2be:1f56:ed32 with SMTP id
 5a478bee46e88-2c0e4f79e7amr862302eec.1.1773843705849; Wed, 18 Mar 2026
 07:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
In-Reply-To: <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 15:21:33 +0100
X-Gm-Features: AaiRm52hYvm4SlfuaD_e2Ur_BKHJMunoPzi20wYq7repEoz5nN2Go3Dpr2oWwgo
Message-ID: <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 11:54=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> Ah, so there is a rationale for using a `mod.rs` file after all. What
> are the project-wide guidelines re: `foo.rs` vs `foo/mod.rs`?

Quoting myself from a few years ago:

  I don't have a strong opinion either way -- this was originally done
  to improve fuzzy searching, see commit 829c2df153d7 ("rust: move `net`
  and `sync` modules to uniquely-named files") upstream:

    This is so that each file in the module has a unique name instead of th=
e
    generic `mod.rs` name. It makes it easier to open files when using fuzz=
y
    finders like `fzf` once names are unique.

Another reason was that it is what upstream Rust recommends:

  "Prior to rustc 1.30, using `mod.rs` files was the way to load a
module with nested children. It is encouraged to use the new naming
convention as it is more consistent, and avoids having many files
named mod.rs within a project."

  https://doc.rust-lang.org/reference/items/modules.html#r-items.mod.outlin=
ed.search-mod
  https://doc.rust-lang.org/edition-guide/rust-2018/path-changes.html#no-mo=
re-modrs

Now, several other people have argued for the other way over the years.

For instance, one reason is that tab completion can be smoother with
`mod.rs`, e.g. every time you complete something like
`rust/kernel/sync`, you have to decide whether you want `sync.rs` or
`sync/`, and then if you wanted the folder, you have to tab-complete
again.

So I guess it depends if you use more the shell TAB (like Linus really
values on the C folders) or the fuzzy finder (like Wedson argued for
in the commit referenced above).

I personally don't want to bias it one way or the other [*], but
please let's avoid having both mixed if possible (unless there is a
reason not to). I can put the result in the new guidelines rules list
file.

I hope that gives some context!

[*] I would have preferred a middle ground like  modules being inside
but repeating the folder name, e.g. `.../pci/pci.rs`, but I doubt that
will ever be supported upstream since one probably wants to support
the other ways at the same time.

Cheers,
Miguel
